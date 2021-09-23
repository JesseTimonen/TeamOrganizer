teamCommand = Turbine.ShellCommand();

-- Execute command --
function teamCommand:Execute(command, args)
	-- Check if command has no arguments --
	if string.len(args) < 1 then toggleVisibility(not UI.mainWindow:IsVisible()); return; end

	-- Turn arguments to lower case characters --
	args = string.lower(args);

	-- Command: display command help message --
	if string.find(args, translate("TEXT_COMMAND_HELP", clientLanguage)) == 1 then notification(translate("TEXT_COMMAND_ARGUMENTS")); return; end

	-- Command: toggle visibility --
	if string.find(args, translate("TEXT_COMMAND_SHOW", clientLanguage)) == 1 then toggleVisibility(true); return; end
	if string.find(args, translate("TEXT_COMMAND_HIDE", clientLanguage)) == 1 then toggleVisibility(false); return; end
	if string.find(args, translate("TEXT_COMMAND_TOGGLE", clientLanguage)) == 1 then toggleVisibility(not UI.mainWindow:IsVisible()); return; end

	-- Command: save group --
	if string.find(args, translate("TEXT_COMMAND_SAVE", clientLanguage)) == 1 then saveGroupCommand(string.match(args, translate("TEXT_COMMAND_SAVE", clientLanguage) .. "(%S+)")); return; end

	-- Command: load group --
	if string.find(args, translate("TEXT_COMMAND_LOAD", clientLanguage)) == 1 then loadGroupCommand(string.match(args, translate("TEXT_COMMAND_LOAD", clientLanguage) .. "(%S+)")); return; end

	-- Command: add player to group --
	if string.find(args, translate("TEXT_COMMAND_ADD", clientLanguage)) == 1 then addPlayerCommand(string.match(args, translate("TEXT_COMMAND_ADD", clientLanguage) .. "(%S+)"), args:match("%s(%S+)$")); return; end

	-- Command: change player information --
	if string.find(args, translate("TEXT_COMMAND_CHANGE", clientLanguage)) == 1 then changePlayerCommand(args:gmatch("%S+")); return; end

	-- Command: remove player from group --
	if string.find(args, translate("TEXT_COMMAND_REMOVE", clientLanguage)) == 1 then removePlayerCommand(string.match(args, translate("TEXT_COMMAND_REMOVE", clientLanguage) .. "(%S+)")); return; end

	-- Command: clear window --
	if string.find(args, translate("TEXT_COMMAND_CLEAR", clientLanguage)) == 1 then clearWindowCommand(); return; end

	-- Unknown command argument --
	notification(rgb["error"] .. translate("TEXT_COMMAND_UNKNOWN_1") .. translate("TEXT_COMMAND_HELP", clientLanguage) .. translate("TEXT_COMMAND_UNKNOWN_2") .. rgb["clear"]);
end


-- Toggle visibility of the main window --
function toggleVisibility(state)
	UI.mainWindow:SetVisible(state);
end


-- Save group --
function saveGroupCommand(name)
	-- Turn group name to lower capitals and remove spaces
	name = string.lower(name);
	name = name:gsub("%s+", "");
	
	-- Make sure group name is not empty --
	if (string.len(name) < 1) then
		notification(rgb["error"] .. translate("TEXT_INVALID_SAVE_NAME") .. rgb["clear"]);
		return false;
	end

	-- Make sure group name is shorter than 50 characters --
	if (string.len(name) > 50) then
		notification(rgb["error"] .. translate("TEXT_SAVE_NAME_TOO_LONG") .. rgb["clear"]);
		return false;
	end

	-- Return error if there is no group to save --
	if Utility.getTableSize(groupMembers) < 1 then
		notification(rgb["error"] .. translate("TEXT_NOTHING_TO_SAVE") .. rgb["clear"]);
		errorMessage(translate("TEXT_NOTHING_TO_SAVE"))
		return false;
	end

	-- Check if group name contains invalid characters --
	if name == nil or name:match("%W") then
		notification(rgb["error"] .. translate("TEXT_INVALID_SAVE_NAME") .. rgb["clear"]);
		errorMessage(translate("TEXT_FAILED_TO_SAVE_GROUP"));
		return false;
	end

	-- Save group --
	if (not Utility.inTable(savedGroupNames, name)) then savedGroupNames[name] = name; end
	Turbine.PluginData.Save(Turbine.DataScope.Server, customGroupFileName .. name, groupMembers);
	notification(translate("TEXT_GROUP_SAVED") .. name);
	return true;
end


-- Load group --
function loadGroupCommand(name)
	-- Turn group name to lower capitals --
	name = string.lower(name);

	-- Check if group name contains invalid characters --
	if name == nil or name:match("%W") then
		notification(rgb["error"] .. translate("TEXT_INVALID_LOAD_NAME") .. rgb["clear"]);
		errorMessage(translate("TEXT_FAILED_TO_LOAD_GROUP"));
		return false;
	end

	-- Load group --
	settings["loadRequest"] = name;
	reloadPlugin();
end


-- Add player into a group --
function addPlayerCommand(player, class, changePlayer)
	-- Check if group is already full --
	if (Utility.getTableSize(groupMembers) >= 23) then
		notification(rgb["error"] .. translate("TEXT_GROUP_FULL_ERROR") .. rgb["clear"]);
		return false;
	end
	
	-- Capitalize first character --
	player = player:gsub("^%l", string.upper)

	-- Prevent player from adding itself to the list --
	if (player == playerName) then
		return false;
	end
	
	-- Get ID of the class --
	classID = Utility.getClassIDFromName(class);

	-- Make sure player gave a valid class --
	if (classID == nil) then
		if (string.lower(player) == string.lower(class)) then
			notification(rgb["error"] .. translate("TEXT_MISSING_CLASS") .. player .. "!" .. rgb["clear"] .. translate("TEXT_ADD_COMMAND_MESSAGE"));
		else
			notification(rgb["error"] .. class .. translate("TEXT_INVALID_CLASS") .. rgb["clear"] .. translate("TEXT_ADD_COMMAND_MESSAGE"));
		end
		return false;
	end

	-- Create new player --
	local member = Turbine.Object();
	member.name = player;
	member.class = tostring(classID);

	-- Add new player to group --
	if (groupMembers == nil) then
		groupMembers = {};
		groupMembers["1"] = member;
	else
		playerFound = false;
		for k,v in pairs(groupMembers) do
			if (v["name"] == player) then
				playerFound = true;
			end
		end

		-- Check if player is already in the group setup --
		if (playerFound == false) then
			groupMembers[tostring(Utility.getTableSize(groupMembers) + 1)] = member;
		else
			notification(rgb["error"] .. "'" .. player .. "'" .. translate("TEXT_PLAYER_ALREADY_IN_GROUP_SETUP") .. rgb["clear"]);
			return false;
		end
	end

	if (changePlayer == true) then
		return;
	end

	-- Save new player --
	settings["loadRequest"] = "previous group";
	Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, groupMembers);
	reloadPlugin();
end


-- Change player --
function changePlayerCommand(args)
	-- Get arguments --
	local command = {};
	for argument in args do
		table.insert(command, argument)
	end

	local original = "";
	local player = "";
	local class = "";

	-- Return if not enough arguments were passed to change command --
	if (Utility.getTableSize(command) < 4) then
		return false;
	end

	-- Parse player name and class from arguments --
	if (Utility.getTableSize(command) > 4) then
		-- /team change <player> to <player> <class> --
		original = command[2];
		player = command[4];
		class = command[5];
	else
		-- /team change <player> <player> <class> --
		original = command[2];
		player = command[3];
		class = command[4];
	end
	
	-- Capitalize first character from player's name --
	original = original:gsub("^%l", string.upper);
	player = player:gsub("^%l", string.upper);

	-- Make sure new name and class are valid --
	if (player == playerName) then return false; end	
	if (Utility.getClassIDFromName(class) == nil) then
		notification(rgb["error"] .. class .. translate("TEXT_INVALID_CLASS") .. rgb["clear"]);
		return false;
	end;

	-- Check if original player is in the group --
	local originalFound = false;
	local playerFound = false;
	for k,v in pairs(groupMembers) do
		if (v["name"] == player and not playerFound) then
			playerFound = true;
		end
		if (v["name"] == original and not originalFound) then
			originalFound = true;
		end
	end

	-- If original player was not found cancel change command --
	if (not originalFound) then
		notification(rgb["error"] .. original .. translate("TEXT_PLAYER_NOT_IN_GROUP") .. rgb["clear"]);
		return false;
	end
	
	-- Remove the new player if the new player is already in the group --
	if (playerFound) then
		removePlayerCommand(player, true);
	end

	-- Remove the original player if the new player is not the same as the original --
	if (player ~= original) then
		removePlayerCommand(original, true);
	end

	-- Change player --
	addPlayerCommand(player, class, true);
	settings["loadRequest"] = "previous group";
	Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, groupMembers);
	reloadPlugin();
end


function removePlayerCommand(player, changePlayer)
	-- Capitalize first character --
	player = player:gsub("^%l", string.upper)

	-- Make sure group is not already empty --
	if (groupMembers == nil) then
		return false;
	end

	local updatedMembers = {};
	local counter = 1;
	local playerFound = false;

	-- Recreate group but exclude removed player --
	for k,v in pairs(groupMembers) do
		if (v["name"] ~= player) then
			local member = Turbine.Object();
			member.name = v["name"];
			member.class = v["class"];
			updatedMembers[tostring(counter)] = member;
			counter = counter + 1;
		else
			playerFound = true;
		end
	end
	groupMembers = updatedMembers;

	-- Check if removed player was found --
	if (playerFound == false) then
		notification(rgb["error"] .. player .. translate("TEXT_PLAYER_NOT_IN_GROUP") .. rgb["clear"]);
		return false;
	end

	if (changePlayer == true) then
		return;
	end

	-- Save updated group --
	settings["loadRequest"] = "previous group";
	Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, groupMembers);
	reloadPlugin();
end


-- Clear Team Organizer window --
function clearWindowCommand()
	settings["loadRequest"] = "clear group"
	Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, nil);
	reloadPlugin();
end


-- Commands --
Turbine.Shell.AddCommand("team", teamCommand);
Turbine.Shell.AddCommand("teamorganizer", teamCommand);
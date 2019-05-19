teamCommand = Turbine.ShellCommand();

-- Execute command --
function teamCommand:Execute(command, args)
	-- Check if command has arguments --
	if string.len(args) < 1 then toggleVisibility(not mainWindow:IsVisible()); return; end

	-- Turn arguments to lower case characters --
	args = string.lower(args);

	-- Display command help message --
	if string.find(args, translate("command_help", clientLanguage)) == 1 then notification(translate("command_arguments", settings["language"])); return; end

	-- Toggle visibility --
	if string.find(args, translate("command_show", clientLanguage)) == 1 then toggleVisibility(true); return; end
	if string.find(args, translate("command_hide", clientLanguage)) == 1 then toggleVisibility(false); return; end
	if string.find(args, translate("command_toggle", clientLanguage)) == 1 then toggleVisibility(not mainWindow:IsVisible()); return; end

	-- Save group --
	if string.find(args, translate("command_save", clientLanguage)) == 1 then saveGroupCommand(string.match(args, translate("command_save", clientLanguage) .. "(%S+)")); return; end

	-- Load group --
	if string.find(args, translate("command_load", clientLanguage)) == 1 then loadGroupCommand(string.match(args, translate("command_load", clientLanguage) .. "(%S+)")); return; end

	-- Add player to group --
	if string.find(args, translate("command_add", clientLanguage)) == 1 then addPlayerCommand(string.match(args, translate("command_add", clientLanguage) .. "(%S+)"), args:match("%s(%S+)$")); return; end

	-- Change player information --
	if string.find(args, translate("command_change", clientLanguage)) == 1 then changePlayerCommand(args:gmatch("%S+")); return; end

	-- Remove player from group --
	if string.find(args, translate("command_remove", clientLanguage)) == 1 then removePlayerCommand(string.match(args, translate("command_remove", clientLanguage) .. "(%S+)")); return; end

	-- Clear window --
	if string.find(args, translate("command_clear", clientLanguage)) == 1 then clearWindowCommand(); return; end

	-- Unknown command argument --
	notification(rgb["error"] .. translate("command_unknown_1", settings["language"]) .. translate("command_help", clientLanguage) .. translate("command_unknown_2", settings["language"]) .. rgb["clear"]);
end


-- Toggle visibility of the main window --
function toggleVisibility(state)
	mainWindow:SetVisible(state);
end


-- Save group --
function saveGroupCommand(name)
	-- Return error if there is no group to save --
	if Utility.getLenght(groupMembers) < 1 then
		notification(rgb["error"] .. translate("nothingToSave", settings["language"]) .. rgb["clear"]);
		errorMessage(translate("nothingToSave", settings["language"]))
		return;
	end

	-- Check if name contains invalid characters --
	if name == nil or name:match("%W") then
		notification(rgb["error"] .. translate("invalidSaveName", settings["language"]) .. rgb["clear"]);
		errorMessage(translate("groupSaveFailedError", settings["language"]));
		return;
	end

	-- Save group --
	save("server", customGroupFileName .. name, groupMembers);
	notification(translate("groupSaved", settings["language"]) .. " " .. name);
end


-- Load group --
function loadGroupCommand(name)
	-- Check if name contains invalid characters --
	if name == nil or name:match("%W") then
		notification(rgb["error"] .. translate("invalidLoadName", settings["language"]) .. rgb["clear"]);
		errorMessage(translate("groupLoadFailedError", settings["language"]));
		return;
	end

	settings["loadRequest"] = name;
	reloadPlugin();
end


-- Add player into a group --
function addPlayerCommand(player, class, changePlayer)
	-- Capitalize first character --
	player = player:gsub("^%l", string.upper)

	-- Prevent player from adding itself to the list --
	if (player == playerName) then
		return;
	end
	
	-- Get ID of the class --
	classID = Utility.getClassID(class);

	-- Make sure player gave a valid class --
	if (classID == nil) then
		if (string.lower(player) == string.lower(class)) then
			notification(rgb["error"] .. translate("missingClass", settings["language"]) .. player .. "!" .. rgb["clear"] .. translate("addCommandUsage", settings["language"]));
		else
			notification(rgb["error"] .. class .. translate("invalidClass", settings["language"]) .. rgb["clear"] .. translate("addCommandUsage", settings["language"]));
		end
		return;
	end

	-- Create new player --
	local member = Turbine.Object();
	member.name = player;
	member.class = tostring(classID);

	-- Add player to group --
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

		-- Check is player already in your group setup --
		if (playerFound == false) then
			groupMembers[tostring(Utility.getLenght(groupMembers) + 1)] = member;
		else
			notification(rgb["error"] .. player .. translate("playerAlreadyInGroupSetup", settings["language"]) .. rgb["clear"]);
			return;
		end
	end

	if (changePlayer == true) then
		return;
	end

	-- Save new player --
	settings["loadRequest"] = "previous group";
	save("server", groupMembersFileName, groupMembers);
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
	if (Utility.getLenght(command) < 4) then
		return;
	end

	-- Parse player name and class from arguments
	if (Utility.getLenght(command) > 4) then
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

	-- Capitalize first character from player names --
	original = original:gsub("^%l", string.upper)
	player = player:gsub("^%l", string.upper)

	-- Make original player is in party --
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
		notification(rgb["error"] .. player .. translate("playerNotInGroup", settings["language"]) .. rgb["clear"]);
		return;
	end

	-- If player was found, remove player aswell so we can add the player again --
	if (playerFound) then
		removePlayerCommand(player, true);
	end
	
	-- Change player --
	removePlayerCommand(original, true);
	addPlayerCommand(player, class, true);
	settings["loadRequest"] = "previous group";
	save("server", groupMembersFileName, groupMembers);
	reloadPlugin();
end


-- Remove player from a group --
function removePlayerCommand(player, changePlayer)
	-- Capitalize first character --
	player = player:gsub("^%l", string.upper)

	-- Make sure group is not already empty --
	if (groupMembers == nil) then
		return;
	end

	local updatedMembers = {};
	local counter = 1;
	local playerFound = false;

	-- Recreate group but don't include removed player --
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
		notification(rgb["error"] .. player .. translate("playerNotInGroup", settings["language"]) .. rgb["clear"]);
		return;
	end

	if (changePlayer == true) then
		return;
	end

	-- Save updated group --
	settings["loadRequest"] = "previous group";
	save("server", groupMembersFileName, groupMembers);
	reloadPlugin();
end


-- Clear Team Organizer window --
function clearWindowCommand(name)
	settings["loadRequest"] = "clear group"
	save("server", groupMembersFileName, nil);
	reloadPlugin();
end


-- Commands --
Turbine.Shell.AddCommand("team", teamCommand);
Turbine.Shell.AddCommand("teamorganizer", teamCommand);
teamCommand = Turbine.ShellCommand();

-- Execute command --
function teamCommand:Execute(cmd, args)
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

	-- Remove player from group --
	if string.find(args, translate("command_remove", clientLanguage)) == 1 then removePlayerCommand(string.match(args, translate("command_remove", clientLanguage) .. "(%S+)")); return; end

	-- Clear window --
	if string.find(args, translate("command_clear", clientLanguage)) == 1 then clearWindowCommand(); return; end

	-- Unknown command argument --
	notification(rgb["error"] .. translate("command_unknown", clientLanguage) .. rgb["clear"]);
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
	saveData(Turbine.DataScope.Server, "TeamOrganizer_CustomData_" .. name, groupMembers);
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

	saveData(Turbine.DataScope.Server, "TeamOrganizer_LoadRequest", name);
	reloadPlugin();
end

-- Add player into a group --
function addPlayerCommand(player, class)
	-- Prevent player from adding itself to the list --
	if (string.lower(player) == string.lower(playerName)) then
		return;
	end
	
	-- Get ID of the class --
	classID = Utility.getClassID(class);

	-- Make sure player gave a valid class --
	if (classID == nil) then
		notification(rgb["error"] .. class .. translate("invalidClass", settings["language"]) .. rgb["clear"] .. translate("addCommandUsage", settings["language"]));
		return;
	end

	-- Create new player --
	local member = Turbine.Object();
	member.name = player;
	member.class = tostring(classID);

	if (groupMembers == nil) then
		groupMembers = {};
		groupMembers["1"] = member;
	else
		groupMembers[tostring(Utility.getLenght(groupMembers) + 1)] = member;
	end

	-- Save new player --
	saveData(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers", groupMembers);
	reloadPlugin();
end

-- Remove player from a group --
function removePlayerCommand(player)
	-- Make sure group is not already empty --
	if (groupMembers == nil) then
		return;
	end

	local updatedMembers = {};
	local counter = 1;
	local playerFound = false;

	-- update group --
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

	-- Check if removed player was found --
	if (playerFound == false) then
		notification(rgb["error"] .. player .. translate("playerNotInGroup", settings["language"]) .. rgb["clear"]);
		return;
	end

	-- Save updated group --
	saveData(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers", updatedMembers);
	reloadPlugin();
end

-- Clear Team Organizer window --
function clearWindowCommand(name)
	saveData(Turbine.DataScope.Server, "TeamOrganizer_LoadRequest", "Clear Groups");
	saveData(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers", nil);
	reloadPlugin();
end


-- Commands --
Turbine.Shell.AddCommand("team", teamCommand);
Turbine.Shell.AddCommand("teamorganizer", teamCommand);
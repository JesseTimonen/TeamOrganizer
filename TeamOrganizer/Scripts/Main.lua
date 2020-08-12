-- Function for reloading the plugin --
function reloadPlugin()
	Turbine.PluginManager.LoadPlugin(pluginReloaderName);
end

-- Update method to see if plugin was reloaded --
UI.mainWindow.Update = function()

	-- Unload reloader plugin --
	Turbine.PluginManager.UnloadScriptState(pluginReloaderName);
	UI.mainWindow:SetWantsUpdates(false);

	-- Get players and Update UI if '/clear' command was not used --
	if loadRequest ~= "Clear Groups" then

		-- Check if player is in party --
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();
		if loadRequest == nil then
			if party == nil then
				errorMessage(translate("noParty"));
				loadRequest = "Previous Group";
			else
				getPlayers();
			end
		end
	
		-- Create UI placeholders for party members --
		Scripts.UI.createUIPlaceholders();
		-- Update UI with found party members --
		updateUI();
	end
end
UI.mainWindow:SetWantsUpdates(true);


function getPlayers()
	-- Reset previous party members --
	groupMembers = {};
	offset = 0;

	-- Get players --
	for i = 1, party:GetMemberCount() do
		local member = Turbine.Object();
		member.name = party:GetMember(i):GetName();
		member.class = tostring(party:GetMember(i):GetClass());

		-- Avoid adding plugin owner into the array --
		if (member.name ~= playerName) then
			-- We have to save index as a string, since some clients turn . into , which causes errors when loading data --
			groupMembers[tostring(i - offset)] = member;
		else
			-- Offset players when plugin owner is found --
			offset = 1;
		end
	end

	-- Save party members to prevent losing data when disconnecting or switching characters --
	save("server", groupMembersFileName, groupMembers);
end


function updateUI()
	-- Hide previous party members --
	clearWindow();

	-- Return if group is empty --
	if groupMembers == nil then return end

	-- Sort party members --
	Utility.sortPartyMembers(groupMembers);

	-- Get party members count --
	groupMembersCount = Utility.getLenght(groupMembers);

	-- Update the size of the main window depending on how many members group has --
	local height;
	local width;
	if (groupMembersCount > 11 and settings["horizontalWindow"]) then
		width = 520;
		height = 470;
	else
		if (groupMembersCount > 11 and not settings["horizontalWindow"]) then
			width = 285;
			height = 750;
		else
			width = 285;
			height = 470;
		end
	end

	-- Update UI dimensions --
	UI.mainWindow:SetSize(width, height);
	UI.errorLabel:SetPosition(UI.mainWindow:GetWidth()/2 - UI.errorLabel:GetWidth()/2, UI.mainWindow:GetHeight() - 80);
	UI.saveGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.saveGroupButton:GetWidth()/2 - 80, UI.mainWindow:GetHeight() - 40);
	UI.loadGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.loadGroupButton:GetWidth()/2, UI.mainWindow:GetHeight() - 40);
	UI.deleteGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.deleteGroupButton:GetWidth()/2 + 80, UI.mainWindow:GetHeight() - 40);


	-- Loop through the party members and add party member's information to placeholder UI elements --
	for i = 1, groupMembersCount do
		-- Stop loop if there are too many players --
		if i > 23 then break end

		-- Class icons --
		icons[i]:SetVisible(true);
		icons[i]:SetBackground("TeamOrganizer/Images/Classes/" .. groupMembers[tostring(i)].class .. ".tga");

		-- Members' names
		names[i]:SetVisible(true);
		names[i]:SetText(groupMembers[tostring(i)].name);
		if (Utility.playerIsInGroup(groupMembers[tostring(i)].name)) then
			names[i]:SetForeColor(playerNameColor["inParty"]);
		else
			names[i]:SetForeColor(playerNameColor["notInParty"]);
		end

		-- Invite buttons --
		inviteButtons[i].quickSlot:SetVisible(true);
		inviteButtons[i].button:SetVisible(true);
		local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_invite", clientLanguage) .. groupMembers[tostring(i)].name);
		inviteButtons[i].quickSlot:SetShortcut(act);
		inviteButtons[i].quickSlot:SetAllowDrop(false);

		-- Dismiss buttons --
		if (settings["enableDismiss"]) then
			dismissButtons[i].quickSlot:SetVisible(true);
			dismissButtons[i].button:SetVisible(true);
		end

		local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_dismiss", clientLanguage) .. groupMembers[tostring(i)].name);
		if (settings["enableDismiss"]) then
			dismissButtons[i].quickSlot:SetShortcut(act);
			dismissButtons[i].quickSlot:SetAllowDrop(false);
		end
	end
end


function clearWindow()
	-- Hide previous party members --
	for i = 1, 23 do
		icons[i]:SetVisible(false);
		names[i]:SetVisible(false);
		inviteButtons[i].quickSlot:SetVisible(false);
		inviteButtons[i].button:SetVisible(false);
		if (settings["enableDismiss"]) then
			dismissButtons[i].quickSlot:SetVisible(false);
			dismissButtons[i].button:SetVisible(false);
		end
	end
end


-- Hide main window if escape is pressed and escape setting is enabled --
UI.mainWindow.KeyDown = function(sender,args)
    if (args.Action == 145 and settings["enableEscape"]) then
        UI.mainWindow:SetVisible(false);
    end
end
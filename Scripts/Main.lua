-- Function for reloading the plugin --
function reloadPlugin()
	Turbine.PluginManager.LoadPlugin(pluginReloaderName);
end



-- Update method called once everytime plugin is reloaded --
UI.mainWindow.Update = function()
	UI.mainWindow:SetWantsUpdates(false);

	-- Unload reloader plugin --
	Turbine.PluginManager.UnloadScriptState(pluginReloaderName);

	-- Create UI placeholders for party members --
	Scripts.UI.createUIPlaceholders();

	-- Update UI with party members --
	updateUI();
end
UI.mainWindow:SetWantsUpdates(true);



function updateUI()
	-- Hide previous party members --
	clearWindow();

	-- Count party members --
	groupMembersCount = Utility.getTableSize(groupMembers);

	-- Return if group is empty --
	if (groupMembersCount == 0) then return; end

	-- Sort party members --
	Utility.sortPartyMembers(groupMembers);

	-- Update the size of the main window depending on how many members were found --
	local height;
	local width;
	if (groupMembersCount > 11 and settings["horizontalWindow"]) then
		width = 550;
		height = 470;
	else
		if (groupMembersCount > 11 and not settings["horizontalWindow"]) then
			width = 300;
			height = 770;
		else
			width = 300;
			height = 470;
		end
	end

	-- Update UI size and element positions --
	UI.mainWindow:SetSize(width, height);
	UI.errorLabel:SetPosition(UI.mainWindow:GetWidth()/2 - UI.errorLabel:GetWidth()/2, UI.mainWindow:GetHeight() - 80);
	UI.saveGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.saveGroupButton:GetWidth()/2 - 90, UI.mainWindow:GetHeight() - 40);
	UI.loadGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.loadGroupButton:GetWidth()/2, UI.mainWindow:GetHeight() - 40);
	UI.deleteGroupButton:SetPosition(UI.mainWindow:GetWidth()/2 - UI.deleteGroupButton:GetWidth()/2 + 90, UI.mainWindow:GetHeight() - 40);

	-- Loop through party members and add party member's information to placeholder UI elements --
	for i = 1, groupMembersCount do
		-- Stop loop if there are too many players --
		if i > 23 then break end

		-- Class icons --
		icons[i]:SetVisible(true);
		icons[i]:SetBackground("TeamOrganizer/Images/Classes/" .. Utility.getClassNameFromID(groupMembers[tostring(i)].class) .. ".tga");

		-- Party members' names
		names[i]:SetVisible(true);
		names[i]:SetText(groupMembers[tostring(i)].name);
		if (Utility.isPlayerAlreadyInYourGroup(groupMembers[tostring(i)].name)) then
			names[i]:SetForeColor(playerNameColor["inParty"]);
		else
			names[i]:SetForeColor(playerNameColor["notInParty"]);
		end

		-- Invite buttons --
		local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_invite", clientLanguage) .. groupMembers[tostring(i)].name);
		inviteButtons[i].quickSlot:SetVisible(true);
		inviteButtons[i].button:SetVisible(true);
		inviteButtons[i].quickSlot:SetShortcut(act);
		inviteButtons[i].quickSlot:SetAllowDrop(false);

		-- Dismiss buttons --
		if (settings["enableDismiss"]) then
			local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_dismiss", clientLanguage) .. groupMembers[tostring(i)].name);
			dismissButtons[i].quickSlot:SetVisible(true);
			dismissButtons[i].button:SetVisible(true);
			dismissButtons[i].quickSlot:SetShortcut(act);
			dismissButtons[i].quickSlot:SetAllowDrop(false);
		end

		if (settings["enablePromote"]) then
			-- Promote buttons --
			local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_promote", clientLanguage) .. groupMembers[tostring(i)].name);
			promoteButtons[i].quickSlot:SetVisible(true);
			promoteButtons[i].button:SetVisible(true);
			promoteButtons[i].quickSlot:SetShortcut(act);
			promoteButtons[i].quickSlot:SetAllowDrop(false);

			-- Demote buttons --
			local act = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, translate("action_demote", clientLanguage) .. groupMembers[tostring(i)].name);
			demoteButtons[i].quickSlot:SetVisible(true);
			demoteButtons[i].button:SetVisible(true);
			demoteButtons[i].quickSlot:SetShortcut(act);
			demoteButtons[i].quickSlot:SetAllowDrop(false);
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
		if (settings["enablePromote"]) then
			promoteButtons[i].quickSlot:SetVisible(false);
			promoteButtons[i].button:SetVisible(false);
			demoteButtons[i].quickSlot:SetVisible(false);
			demoteButtons[i].button:SetVisible(false);
		end
	end
end



-- Hide main window if escape is pressed and escape setting is enabled --
UI.mainWindow.KeyDown = function(sender,args)
    if (args.Action == 145 and settings["enableEscape"]) then
        UI.mainWindow:SetVisible(false);
    end
end
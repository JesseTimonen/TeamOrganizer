-- Main window --
if Scripts.settings["goldenTheme"] then
	mainWindow = Turbine.UI.Lotro.GoldWindow();
else
	mainWindow = Turbine.UI.Lotro.Window();
end

mainWindow:SetText(Scripts.translate("pluginName"));
mainWindow:SetVisible(true);
mainWindow:SetWantsKeyEvents(true);
mainWindow:SetPosition(Scripts.settings["windowPosition"]["xPos"], Scripts.settings["windowPosition"]["yPos"]);
mainWindow:SetSize(300, 470);
if Scripts.settings["forceTop"] then
	mainWindow:SetZOrder(1000);
end


-- Button to get players --
getPlayersButton = Turbine.UI.Lotro.Button();
getPlayersButton:SetText(Scripts.translate("getPlayers"));
getPlayersButton:SetParent(mainWindow);
getPlayersButton:SetSize(120, 40);
getPlayersButton:SetPosition(35, 38);
getPlayersButton.Click = function( sender, args)
	Scripts.reloadPlugin();
end

function closeSideWindows()
	TeamOrganizer.UI.addPlayerWindow:SetVisibility(false);
	TeamOrganizer.UI.removePlayerWindow:SetVisibility(false);
	TeamOrganizer.UI.changePlayerWindow:SetVisibility(false);
	TeamOrganizer.UI.saveGroupWindow:SetVisibility(false);
	TeamOrganizer.UI.loadGroupWindow:SetVisibility(false);
	TeamOrganizer.UI.deleteGroupWindow:SetVisibility(false);
end


-- Button to add players --
addPlayerButton = Turbine.UI.Lotro.Button();
addPlayerButton:SetText("++");
addPlayerButton:SetParent(mainWindow);
addPlayerButton:SetSize(30, 30);
addPlayerButton:SetPosition(35, 65);
addPlayerButton:SetFont(Turbine.UI.Lotro.Font.Verdan22);
addPlayerButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.addPlayerWindow.nameInput:SetText("");
	TeamOrganizer.UI.addPlayerWindow:SetVisibility(true);
end


-- Button to remove players --
removePlayerButton = Turbine.UI.Lotro.Button();
removePlayerButton:SetText("--");
removePlayerButton:SetParent(mainWindow);
removePlayerButton:SetSize(30, 30);
removePlayerButton:SetPosition(75, 65);
removePlayerButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.removePlayerWindow:UpdatePlayersList();
	TeamOrganizer.UI.removePlayerWindow:SetVisibility(true);
end


-- Button to Change players --
changePlayerButton = Turbine.UI.Lotro.Button();
changePlayerButton:SetText("< >");
changePlayerButton:SetParent(mainWindow);
changePlayerButton:SetSize(30, 30);
changePlayerButton:SetPosition(115, 65);
changePlayerButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.changePlayerWindow:UpdatePlayersList();
	TeamOrganizer.UI.changePlayerWindow.nameInput:SetText(TeamOrganizer.UI.changePlayerWindow.playerSelect:GetValue());
	TeamOrganizer.UI.changePlayerWindow:SetVisibility(true);
end


-- Button to save group --
saveGroupButton = Turbine.UI.Lotro.Button();
saveGroupButton:SetText(Scripts.translate("save"));
saveGroupButton:SetParent(mainWindow);
saveGroupButton:SetSize(75, 30);
saveGroupButton:SetPosition((mainWindow:GetWidth()/2 - saveGroupButton:GetWidth()/2) - 80, mainWindow:GetHeight() - 40);
saveGroupButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.saveGroupWindow.nameInput:SetText("");
	TeamOrganizer.UI.saveGroupWindow:SetVisibility(true);
end


-- Button to load group --
loadGroupButton = Turbine.UI.Lotro.Button();
loadGroupButton:SetText(Scripts.translate("load"));
loadGroupButton:SetParent(mainWindow);
loadGroupButton:SetSize(75, 30);
loadGroupButton:SetPosition(mainWindow:GetWidth()/2 - loadGroupButton:GetWidth()/2, mainWindow:GetHeight() - 40);
loadGroupButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.loadGroupWindow:updateGroupList();
	TeamOrganizer.UI.loadGroupWindow:SetVisibility(true);
end


-- Button to Deleting group --
deleteGroupButton = Turbine.UI.Lotro.GoldButton();
deleteGroupButton:SetText(Scripts.translate("delete"));
deleteGroupButton:SetParent(mainWindow);
deleteGroupButton:SetSize(75, 30);
deleteGroupButton:SetPosition((mainWindow:GetWidth()/2 - deleteGroupButton:GetWidth()/2) + 80, mainWindow:GetHeight() - 40);
deleteGroupButton.Click = function( sender, args)
	closeSideWindows();
	TeamOrganizer.UI.deleteGroupWindow:updateGroupList();
	TeamOrganizer.UI.deleteGroupWindow:SetVisibility(true);
end


-- Error Message Label --
errorLabel = Turbine.UI.Label();
errorLabel:SetParent(mainWindow);
errorLabel:SetSize(230, 30);
errorLabel:SetPosition(mainWindow:GetWidth()/2 - errorLabel:GetWidth()/2, mainWindow:GetHeight() - 80);
errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
errorLabel:SetText("");
errorLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
errorLabel:SetForeColor(Scripts.color["red"]);


-- Convert to raid button --
createRaidButton = createButton(mainWindow, 180, 40, 90, 20, Scripts.color["darkGreen"], Scripts.translate("action_raidCreate", Scripts.clientLanguage));
createRaidLabel = createLabel(mainWindow, 175, 38, 100, 20, Scripts.color["white"], Scripts.translate("raid"));
createRaidLabel:SetMouseVisible(false);
createRaidLabel:SetVisible(true);
createRaidLabel:SetZOrder(3);
createRaidLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
createRaidButton.quickSlot:SetVisible(true);
createRaidButton.quickSlot:SetAllowDrop(false);
createRaidButton.button:SetVisible(true);


-- Readycheck button --
readycheckButton = createButton(mainWindow, 180, 65, 90, 20, Scripts.color["darkBlue"], Scripts.translate("action_readycheck", Scripts.clientLanguage));
readycheckLabel = createLabel(mainWindow, 175, 63, 100, 20, Scripts.color["white"], Scripts.translate("readycheck"));
readycheckLabel:SetMouseVisible(false);
readycheckLabel:SetVisible(true);
readycheckLabel:SetZOrder(3);
readycheckLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
readycheckButton.quickSlot:SetVisible(true);
readycheckButton.quickSlot:SetAllowDrop(false);
readycheckButton.button:SetVisible(true);


if Scripts.settings["enableDisband"] then
	-- Disband button --
	disbandButton = createButton(mainWindow, 180, 90, 90, 20, Scripts.color["darkRed"], Scripts.translate("action_raidDisband", Scripts.clientLanguage));
	disbandLabel = createLabel(mainWindow, 175, 88, 100, 20, Scripts.color["white"], Scripts.translate("disband"));
	disbandLabel:SetMouseVisible(false);
	disbandLabel:SetVisible(true);
	disbandLabel:SetZOrder(3);
	disbandLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
	disbandButton.quickSlot:SetVisible(true);
	disbandButton.quickSlot:SetAllowDrop(false);
	disbandButton.button:SetVisible(true);
end


----------------------------------------------------------------------------------------------------


-- Create UI placeholders --
function createUIPlaceholders()
	local xPos = 0;
	local yPos = 100;
	if Scripts.settings["enableDisband"] then
		if not Scripts.settings["horizontalWindow"] or Scripts.Utility.getTableSize(Scripts.groupMembers) < 12 then
			yPos = 120;
		end
	end
	
	-- Create placeholders for all party members --
	for i = 1, 23 do
		-- Create 2nd column if party has more than 12 players and horizontal option is enabled --
		if i == 12 and Scripts.settings["horizontalWindow"] then
			xPos = 260;
			yPos = 100;

			-- Move disband button to the side of create raid button --
			if (Scripts.Utility.getTableSize(Scripts.groupMembers) > 11 and Scripts.settings["enableDisband"]) then
				disbandLabel:SetPosition(275, 38);
				disbandButton.quickSlot:SetPosition(280, 40);
				disbandButton.button:SetPosition(280, 40);
			end
		end

		-- Placeholders for icons --
		local icon = createClassIcon(mainWindow, xPos + 30, yPos + 1, 20, 20, "");
		table.insert(Scripts.icons, icon);

		-- Placeholders for names --
		local nameLabel = createLabel(mainWindow, xPos + 60, yPos + 2, 120, 19, Scripts.playerNameColor["notInParty"], "");
		table.insert(Scripts.names, nameLabel);

		-- Placeholders for buttons --
		if (Scripts.settings["enableDismiss"]) then
			if (Scripts.settings["enablePromote"]) then
				-- Invite buttons --
				local inviteButton = createButton(mainWindow, xPos + 180, yPos + 5, 30, 15, Scripts.color["green"], "");
				table.insert(Scripts.inviteButtons, inviteButton);
				-- Dismiss buttons --
				local dismissButton = createButton(mainWindow, xPos + 255, yPos + 5, 15, 15, Scripts.color["red"], "");
				table.insert(Scripts.dismissButtons, dismissButton);
				-- Promote buttons --
				local promoteButton = createButton(mainWindow, xPos + 215, yPos + 5, 15, 15, Scripts.color["lightBlue"], "");
				table.insert(Scripts.promoteButtons, promoteButton);
				-- Demote buttons --
				local demoteButton = createButton(mainWindow, xPos + 235, yPos + 5, 15, 15, Scripts.color["orange"], "");
				table.insert(Scripts.demoteButtons, demoteButton);
			else
				-- Invite buttons --
				local inviteButton = createButton(mainWindow, xPos + 195, yPos + 5, 30, 15, Scripts.color["green"], "");
				table.insert(Scripts.inviteButtons, inviteButton);
				-- Dismiss buttons --
				local dismissButton = createButton(mainWindow, xPos + 235, yPos + 5, 20, 15, Scripts.color["red"], "");
				table.insert(Scripts.dismissButtons, dismissButton);
			end
		else
			if (Scripts.settings["enablePromote"]) then
				-- Invite buttons --
				local inviteButton = createButton(mainWindow, xPos + 190, yPos + 5, 30, 15, Scripts.color["green"], "");
				table.insert(Scripts.inviteButtons, inviteButton);
				-- Promote buttons --
				local promoteButton = createButton(mainWindow, xPos + 225, yPos + 5, 15, 15, Scripts.color["lightBlue"], "");
				table.insert(Scripts.promoteButtons, promoteButton);
				-- Demote buttons --
				local demoteButton = createButton(mainWindow, xPos + 245, yPos + 5, 15, 15, Scripts.color["orange"], "");
				table.insert(Scripts.demoteButtons, demoteButton);
			else
				-- Invite buttons --
				local inviteButton = createButton(mainWindow, xPos + 210, yPos + 5, 30, 15, Scripts.color["green"], "");
				table.insert(Scripts.inviteButtons, inviteButton);
			end
		end

		-- Update Y-position --
		yPos = yPos + 25;
	end
end
-- Main window --
if settings["goldenTheme"] then
	mainWindow = Turbine.UI.Lotro.GoldWindow();
else
	mainWindow = Turbine.UI.Lotro.Window();
end

mainWindow:SetText(translate("pluginName", settings["language"]));
mainWindow:SetVisible(true);
mainWindow:SetWantsKeyEvents(true);
mainWindow:SetPosition(windowPosition["xPos"], windowPosition["yPos"]);
mainWindow:SetSize(285, 450);
mainWindow:SetZOrder(1000);
mainWindow.font = Turbine.UI.Lotro.Font.Verdana8;
mainWindow.fontColor = color["white"];


-- Button to get players --
getPlayersButton = Turbine.UI.Lotro.Button();
getPlayersButton:SetText(translate("getPlayers", settings["language"]));
getPlayersButton:SetParent(mainWindow);
getPlayersButton:SetSize(120, 40);
getPlayersButton:SetPosition(35, 52);
getPlayersButton.Click = function( sender, args)
	reloadPlugin();
end


-- Error Message Label --
errorLabel = Turbine.UI.Label();
errorLabel:SetParent(mainWindow);
errorLabel:SetSize(230, 30);
errorLabel:SetPosition(mainWindow:GetSize()/2 - errorLabel:GetSize()/2, 400);
errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
errorLabel:SetText("");
errorLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
errorLabel:SetForeColor(color["red"]);


-- Convert to raid button --
if settings["language"] == "german" then
	createRaidButton = Utility.createButton(mainWindow, 165, 40, 90, 20, color["darkGreen"], translate("action_raidCreate", clientLanguage));
	createRaidLabel = Utility.createLabel(mainWindow, 160, 38, 100, 20, color["white"], translate("raid", settings["language"]));
elseif settings["language"] == "french" then
	createRaidButton = Utility.createButton(mainWindow, 180, 40, 70, 20, color["darkGreen"], translate("action_raidCreate", clientLanguage));
	createRaidLabel = Utility.createLabel(mainWindow, 165, 38, 100, 20, color["white"], translate("raid", settings["language"]));
else
	createRaidButton = Utility.createButton(mainWindow, 190, 40, 60, 20, color["darkGreen"], translate("action_raidCreate", clientLanguage));
	createRaidLabel = Utility.createLabel(mainWindow, 170, 38, 100, 20, color["white"], translate("raid", settings["language"]));
end
createRaidLabel:SetMouseVisible(false);
createRaidLabel:SetVisible(true);
createRaidLabel:SetZOrder(3);
createRaidLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
createRaidButton.quickSlot:SetVisible(true);
createRaidButton.button:SetVisible(true);


-- Readycheck button --
if settings["language"] == "german" then
	readycheckButton = Utility.createButton(mainWindow, 165, 65, 90, 20, color["darkBlue"], translate("action_readycheck", clientLanguage));
	readycheckLabel = Utility.createLabel(mainWindow, 160, 63, 100, 20, color["white"], translate("readycheck", settings["language"]));
elseif settings["language"] == "french" then
	readycheckButton = Utility.createButton(mainWindow, 180, 65, 70, 20, color["darkBlue"], translate("action_readycheck", clientLanguage));
	readycheckLabel = Utility.createLabel(mainWindow, 165, 63, 100, 20, color["white"], translate("readycheck", settings["language"]));
else
	readycheckButton = Utility.createButton(mainWindow, 190, 65, 60, 20, color["darkBlue"], translate("action_readycheck", clientLanguage));
	readycheckLabel = Utility.createLabel(mainWindow, 170, 63, 100, 20, color["white"], translate("readycheck", settings["language"]));
end
readycheckLabel:SetMouseVisible(false);
readycheckLabel:SetVisible(true);
readycheckLabel:SetZOrder(3);
readycheckLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
readycheckButton.quickSlot:SetVisible(true);
readycheckButton.button:SetVisible(true);


if settings["enableDisband"] then
	-- Disband button --
	if settings["language"] == "german" then
		disbandButton = Utility.createButton(mainWindow, 165, 90, 90, 20, color["darkRed"], translate("action_raidDisband", clientLanguage));
		disbandLabel = Utility.createLabel(mainWindow, 160, 88, 100, 20, color["white"], translate("disband", settings["language"]));
	elseif settings["language"] == "french" then
		disbandButton = Utility.createButton(mainWindow, 180, 90, 70, 20, color["darkRed"], translate("action_raidDisband", clientLanguage));
		disbandLabel = Utility.createLabel(mainWindow, 165, 88, 100, 20, color["white"], translate("disband", settings["language"]));
	else
		disbandButton = Utility.createButton(mainWindow, 190, 90, 60, 20, color["darkRed"], translate("action_raidDisband", clientLanguage));
		disbandLabel = Utility.createLabel(mainWindow, 170, 88, 100, 20, color["white"], translate("disband", settings["language"]));
	end
	disbandLabel:SetMouseVisible(false);
	disbandLabel:SetVisible(true);
	disbandLabel:SetZOrder(3);
	disbandLabel:SetTextAlignment(Turbine.UI.ContentAlignment.BottomCenter);
	disbandButton.quickSlot:SetVisible(true);
	disbandButton.button:SetVisible(true);
end


----------------------------------------------------------------------------------------------------


-- Create UI placeholders --
function createUIPlaceholders()
	local xPos = 0;
	local yPos = 100;
	if settings["enableDisband"] then
		if not settings["horizontalWindow"] or Utility.getLenght(groupMembers) < 12 then
			-- Reposition UI components --
			yPos = 120;
			getPlayersButton:SetPosition(35, 65);
		end
	end
	
	-- Create placeholders for all party members --
	for i = 1, 23 do
		-- Create 2nd column if party has more than 12 players and horizontal option is enabled --
		if i == 12 and settings["horizontalWindow"] then
			xPos = 240;
			yPos = 100;

			-- Move disband button to the side of create raid button --
			if (Utility.getLenght(groupMembers) > 11 and settings["enableDisband"]) then
				if settings["language"] == "german" then
					disbandLabel:SetPosition(260, 38);
					disbandButton.quickSlot:SetPosition(265, 40);
					disbandButton.button:SetPosition(265, 40);
				elseif settings["language"] == "french" then
					disbandLabel:SetPosition(240, 38);
					disbandButton.quickSlot:SetPosition(255, 40);
					disbandButton.button:SetPosition(255, 40);
				else
					disbandLabel:SetPosition(235, 38);
					disbandButton.quickSlot:SetPosition(255, 40);
					disbandButton.button:SetPosition(255, 40);
				end
			end
		end

		-- Placeholders for icons --
		local icon = Utility.createClassIcon(mainWindow, xPos + 30, yPos, 21, 21, "");
		table.insert(icons, icon);

		-- Placeholders for names --
		local nameLabel = Utility.createLabel(mainWindow, xPos + 60, yPos, 120, 21, playerNameColor["notInParty"], "");
		table.insert(names, nameLabel);

		-- Placeholders for invite buttons --
		local inviteButton = Utility.createButton(mainWindow, xPos + 190, yPos + 5, 30, 15, color["green"], "");
		table.insert(inviteButtons, inviteButton);

		-- Placeholders for dismiss buttons --
		local dismissButton = Utility.createButton(mainWindow, xPos + 230, yPos + 5, 20, 15, color["red"], "");
		table.insert(dismissButtons, dismissButton);

		-- Update Y-position --
		yPos = yPos + 25;
	end
end
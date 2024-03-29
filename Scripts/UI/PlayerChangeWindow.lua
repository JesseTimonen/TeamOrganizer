if Scripts.settings["goldenTheme"] then changePlayerWindow = class(Turbine.UI.Lotro.GoldWindow); else changePlayerWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function changePlayerWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("TEXT_CHANGE_PLAYER"));
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(300, 310);
	self:SetPosition(0, 0);
	self:SetZOrder(1000);
	self.KeyDown = function(sender,args)
		if (args.Action == 145) then
			self:SetVisible(false);
		end
	end

	-- Change label --
	self.nameLabel = Turbine.UI.Label();
	self.nameLabel:SetParent(self);
	self.nameLabel:SetText(Scripts.translate("TEXT_CHANGE"));
	self.nameLabel:SetSize(200, 30);
	self.nameLabel:SetPosition(30, 50);

	-- Player select drop down list --
	self.playerSelect = TeamOrganizer.Utility.DropDownList();
	self.playerSelect:SetParent(self);
	self.playerSelect:SetDropRows(9);
	self.playerSelect:SetSize(240, 20);
	self.playerSelect:SetPosition(30, 70);
	self.playerSelect:SetZOrder(1002);
	self.playerSelect:SetVisible(true);
	self.playerSelect:SetBackColor(Scripts.color["black"]);
	self.playerSelect:SetTextColor(Scripts.color["white"]);
	self.playerSelect:SetCurrentBackColor(Scripts.color["black"]);
	self.playerSelect.SelectedIndexChanged = function()
		self.nameInput:SetText(self.playerSelect:GetValue());
	end

	-- Change to label --
	self.toLabel = Turbine.UI.Label();
	self.toLabel:SetParent(self);
	self.toLabel:SetText(Scripts.translate("TEXT_TO"));
	self.toLabel:SetSize(200, 30);
	self.toLabel:SetPosition(30, 100);

	-- Name textbox --
	self.nameInput = Turbine.UI.TextBox();
	self.nameInput:SetParent(self);
	self.nameInput:SetSize(240, 20);
	self.nameInput:SetPosition(30, 120);
	self.nameInput:SetMultiline(false);
	self.nameInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.nameInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.nameInput:SetForeColor(Scripts.color["black"]);
	self.nameInput:SetBackColor(Scripts.color["white"]);

	-- Class select drop down list --
	self.classSelect = TeamOrganizer.Utility.DropDownList();
	self.classSelect:SetParent(self);
	self.classSelect:SetDropRows(5);
	self.classSelect:SetSize(240, 20);
	self.classSelect:SetPosition(30, 150);
	self.classSelect:SetZOrder(1001);
	self.classSelect:SetBackColor(Scripts.color["black"]);
	self.classSelect:SetTextColor(Scripts.color["white"]);
	self.classSelect:SetCurrentBackColor(Scripts.color["black"]);
	self.classSelect:AddItem(Scripts.translate("TEXT_GUARDIAN"), 23);
	self.classSelect:AddItem(Scripts.translate("TEXT_CAPTAIN"), 24);
	self.classSelect:AddItem(Scripts.translate("TEXT_MINSTREL"), 31);
	self.classSelect:AddItem(Scripts.translate("TEXT_BURGLAR"), 40);
	self.classSelect:AddItem(Scripts.translate("TEXT_HUNTER"), 162);
	self.classSelect:AddItem(Scripts.translate("TEXT_CHAMPION"), 172);
	self.classSelect:AddItem(Scripts.translate("TEXT_LORE_MASTER"), 185);
	self.classSelect:AddItem(Scripts.translate("TEXT_RUNE_KEEPER"), 193);
	self.classSelect:AddItem(Scripts.translate("TEXT_WARDEN"), 194);
	self.classSelect:AddItem(Scripts.translate("TEXT_BEORNING"), 214);
	self.classSelect:AddItem(Scripts.translate("TEXT_BRAWLER"), 215);
	self.classSelect:AddItem(Scripts.translate("TEXT_MARINER"), 216);

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 240);
	self.errorLabel:SetForeColor(Scripts.color["red"]);

	-- Button to change player --
	self.changePlayerButton = Turbine.UI.Lotro.Button();
	self.changePlayerButton:SetParent(self);
	self.changePlayerButton:SetText(Scripts.translate("TEXT_CHANGE_PLAYER"));
	self.changePlayerButton:SetSize(150, 30);
	self.changePlayerButton:SetPosition(self:GetWidth()/2 - self.changePlayerButton:GetWidth()/2, 270);
	self.changePlayerButton.Click = function( sender, args)

		-- Check is there any players to change --
		if (self.playerSelect:GetValue() == nil) then
			self.errorLabel:SetText(Scripts.translate("TEXT_NOTHING_TO_CHANGE"));
			self.errorLabel:SetVisible(true);
			return;
		end
		
		-- Make sure username is not too short --
		if (string.len(self.nameInput:GetText()) < 2) then
			self.errorLabel:SetText(Scripts.translate("TEXT_NAME_TOO_SHORT"));
			self.errorLabel:SetVisible(true);
			return;
		end

		-- Create change player command --
		args = "change " .. self.playerSelect:GetValue() .. " to " .. string.match(self.nameInput:GetText(), "(%S+)")  .. " " .. self.classSelect:GetValue();
		Scripts.changePlayerCommand(args:gmatch("%S+"));
	end
end


-- Update player dropdown list --
function changePlayerWindow:UpdatePlayersList()
	self.playerSelect:ClearList();
	for i = 1, Scripts.Utility.getTableSize(Scripts.groupMembers) do
		self.playerSelect:AddItem(Scripts.groupMembers[tostring(i)].name, Scripts.groupMembers[tostring(i)].name);
	end
end


-- Set Visibility --
function changePlayerWindow:SetVisibility(state)
	if (state == true) then
		self.errorLabel:SetVisible(false);
		
		if (mainWindow:GetLeft() - self:GetWidth() < 0) then
			self:SetPosition(mainWindow:GetLeft()  +  mainWindow:GetWidth(), mainWindow:GetTop());
		else
			self:SetPosition(mainWindow:GetLeft() - self:GetWidth(), mainWindow:GetTop());
		end
	end

	self:SetVisible(state);
end


if (not TeamOrganizer.UI) then TeamOrganizer.UI = {}; end
TeamOrganizer.UI.changePlayerWindow = changePlayerWindow();
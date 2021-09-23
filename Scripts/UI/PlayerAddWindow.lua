if Scripts.settings["goldenTheme"] then addPlayerWindow = class(Turbine.UI.Lotro.GoldWindow); else addPlayerWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function addPlayerWindow:Constructor(windowType)
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("TEXT_ADD_PLAYER"));
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

	-- Name label --
	self.nameLabel = Turbine.UI.Label();
	self.nameLabel:SetParent(self);
	self.nameLabel:SetText(Scripts.translate("TEXT_USERNAME"));
	self.nameLabel:SetSize(200, 30);
	self.nameLabel:SetPosition(30, 60);

	-- Name textbox --
	self.nameInput = Turbine.UI.TextBox();
	self.nameInput:SetParent(self);
	self.nameInput:SetSize(240, 20);
	self.nameInput:SetPosition(30, 80);
	self.nameInput:SetMultiline(false);
	self.nameInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.nameInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.nameInput:SetForeColor(Scripts.color["black"]);
	self.nameInput:SetBackColor(Scripts.color["white"]);

	-- Class label --
	self.classLabel = Turbine.UI.Label();
	self.classLabel:SetParent(self);
	self.classLabel:SetText(Scripts.translate("TEXT_CLASS"));
	self.classLabel:SetSize(200, 30);
	self.classLabel:SetPosition(30, 115);

	-- Class select drop down list --
	self.classSelect = TeamOrganizer.Utility.DropDownList();
	self.classSelect:SetParent(self);
	self.classSelect:SetDropRows(6);
	self.classSelect:SetSize(240, 20);
	self.classSelect:SetPosition(30, 135);
	self.classSelect:SetZOrder(1001);
	self.classSelect:SetBackColor(Scripts.color["black"]);
	self.classSelect:SetTextColor(Scripts.color["white"]);
	self.classSelect:SetCurrentBackColor(Scripts.color["black"]);
	self.classSelect:AddItem(Scripts.translate("TEXT_BEORNING"), 214);
	self.classSelect:AddItem(Scripts.translate("TEXT_BURGLAR"), 40);
	self.classSelect:AddItem(Scripts.translate("TEXT_CAPTAIN"), 24);
	self.classSelect:AddItem(Scripts.translate("TEXT_CHAMPION"), 172);
	self.classSelect:AddItem(Scripts.translate("TEXT_GUARDIAN"), 23);
	self.classSelect:AddItem(Scripts.translate("TEXT_HUNTER"), 162);
	self.classSelect:AddItem(Scripts.translate("TEXT_LORE_MASTER"), 185);
	self.classSelect:AddItem(Scripts.translate("TEXT_MINSTREL"), 31);
	self.classSelect:AddItem(Scripts.translate("TEXT_RUNE_KEEPER"), 193);
	self.classSelect:AddItem(Scripts.translate("TEXT_WARDEN"), 194);

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 240);
	self.errorLabel:SetForeColor(Scripts.color["red"]);

	-- Button to add player --
	self.addPlayerButton = Turbine.UI.Lotro.Button();
	self.addPlayerButton:SetParent(self);
	self.addPlayerButton:SetText(Scripts.translate("TEXT_ADD_PLAYER"));
	self.addPlayerButton:SetSize(130, 30);
	self.addPlayerButton:SetPosition(self:GetWidth()/2 - self.addPlayerButton:GetWidth()/2, 270);
	self.addPlayerButton.Click = function( sender, args)

		-- Make sure username is not too short --
		if (string.len(self.nameInput:GetText()) < 2) then
			self.errorLabel:SetText(Scripts.translate("TEXT_NAME_TOO_SHORT"));
			self.errorLabel:SetVisible(true);
			return;
		end

		-- Check if adding player was successful --
		if (not Scripts.addPlayerCommand(string.match(self.nameInput:GetText(), "(%S+)"), self.classSelect:GetValue())) then
			self.errorLabel:SetText(Scripts.translate("TEXT_FAILED_TO_ADD_PLAYER"));
			self.errorLabel:SetVisible(true);
			return;
		end
	end
end


-- Set Visibility --
function addPlayerWindow:SetVisibility(state)
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
TeamOrganizer.UI.addPlayerWindow = addPlayerWindow();
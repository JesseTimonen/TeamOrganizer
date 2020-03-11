if Scripts.settings["goldenTheme"] then addPlayerWindow = class(Turbine.UI.Lotro.GoldWindow); else addPlayerWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function addPlayerWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("addPlayer"));
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(300, 250);
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
	self.nameLabel:SetText(Scripts.translate("name"));
	self.nameLabel:SetSize(200, 30);
	self.nameLabel:SetPosition(30, 50);

	-- Name textbox --
	self.nameInput = Turbine.UI.TextBox();
	self.nameInput:SetParent(self);
	self.nameInput:SetSize(240, 20);
	self.nameInput:SetPosition(30, 70);
	self.nameInput:SetMultiline(false);
	self.nameInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.nameInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.nameInput:SetForeColor(Scripts.color["black"]);
	self.nameInput:SetBackColor(Scripts.color["white"]);

	-- Class select drop down list --
	self.classSelect = TeamOrganizer.Utility.DropDownList();
	self.classSelect:SetParent(self);
	self.classSelect:SetDropRows(6);
	self.classSelect:SetSize(240, 20);
	self.classSelect:SetPosition(30, 100);
	self.classSelect:SetZOrder(1001);
	self.classSelect:SetBackColor(Turbine.UI.Color(0, 0, 0));
	self.classSelect:SetTextColor(Turbine.UI.Color(1, 1, 1));
	self.classSelect:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	self.classSelect:AddItem(Scripts.translate("beorning"), 214);
	self.classSelect:AddItem(Scripts.translate("burglar"), 40);
	self.classSelect:AddItem(Scripts.translate("captain"), 24);
	self.classSelect:AddItem(Scripts.translate("champion"), 172);
	self.classSelect:AddItem(Scripts.translate("guardian"), 23);
	self.classSelect:AddItem(Scripts.translate("hunter"), 162);
	self.classSelect:AddItem(Scripts.translate("lore_master"), 185);
	self.classSelect:AddItem(Scripts.translate("minstrel"), 31);
	self.classSelect:AddItem(Scripts.translate("rune_keeper"), 193);
	self.classSelect:AddItem(Scripts.translate("warden"), 194);


	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(30, 175);
	self.errorLabel:SetForeColor(Scripts.color["red"]);

	-- Button to add player --
	self.addPlayerButton = Turbine.UI.Lotro.Button();
	self.addPlayerButton:SetParent(self);
	self.addPlayerButton:SetText(Scripts.translate("addPlayer"));
	self.addPlayerButton:SetSize(130, 30);
	self.addPlayerButton:SetPosition(30, 200);
	self.addPlayerButton.Click = function( sender, args)
		-- Give error if name is shorter than 2 characters --
		if (string.len(self.nameInput:GetText()) < 2) then
			self.errorLabel:SetText(Scripts.translate("nameTooShort"));
			self.errorLabel:SetVisible(true);
			return;
		end

		-- Check if removeing player was successful --
		if (not Scripts.addPlayerCommand(string.match(self.nameInput:GetText(), "(%S+)"), self.classSelect:GetValue())) then
			self.errorLabel:SetText(Scripts.translate("addPlayerFailed"));
			self.errorLabel:SetVisible(true);
		end
	end
end


-- Set Visibility --
function addPlayerWindow:SetVisibility(state)
	if (state == true) then
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
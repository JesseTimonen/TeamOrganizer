if Scripts.settings["goldenTheme"] then saveGroupWindow = class(Turbine.UI.Lotro.GoldWindow); else saveGroupWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function saveGroupWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("TEXT_SAVE_GROUP"));
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(300, 240);
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
	self.nameLabel:SetText(Scripts.translate("TEXT_NAME"));
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

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 160);
	self.errorLabel:SetForeColor(Scripts.color["red"]);
	self.errorLabel:SetText(Scripts.translate("TEXT_FAILED_TO_SAVE_GROUP"));

	-- Button to save group --
	self.saveGroupButton = Turbine.UI.Lotro.Button();
	self.saveGroupButton:SetParent(self);
	self.saveGroupButton:SetText(Scripts.translate("TEXT_SAVE_GROUP"));
	self.saveGroupButton:SetSize(150, 30);
	self.saveGroupButton:SetPosition(self:GetWidth()/2 - self.saveGroupButton:GetWidth()/2, 195);
	self.saveGroupButton.Click = function( sender, args)

		-- Check if saving file was successful --
		if (not Scripts.saveGroupCommand(self.nameInput:GetText())) then
			self.errorLabel:SetVisible(true);
		else
			self:SetVisible(false);
		end
	end
end


-- Set Visibility --
function saveGroupWindow:SetVisibility(state)
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
TeamOrganizer.UI.saveGroupWindow = saveGroupWindow();
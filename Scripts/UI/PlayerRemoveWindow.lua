if Scripts.settings["goldenTheme"] then removePlayerWindow = class(Turbine.UI.Lotro.GoldWindow); else removePlayerWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function removePlayerWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("removePlayer"));
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

	-- Player select label --
	self.playerSelectLabel = Turbine.UI.Label();
	self.playerSelectLabel:SetParent(self);
	self.playerSelectLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.playerSelectLabel:SetText(Scripts.translate("selectPlayer"));
	self.playerSelectLabel:SetSize(200, 30);
	self.playerSelectLabel:SetPosition(50, 40);

	-- Player select drop down list --
	self.playerSelect = TeamOrganizer.Utility.DropDownList();
	self.playerSelect:SetParent(self);
	self.playerSelect:SetDropRows(7);
	self.playerSelect:SetSize(200, 20);
	self.playerSelect:SetPosition(50, 70);
	self.playerSelect:SetZOrder(1001);
	self.playerSelect:SetVisible(true);
	self.playerSelect:SetBackColor(Scripts.color["black"]);
	self.playerSelect:SetTextColor(Scripts.color["white"]);
	self.playerSelect:SetCurrentBackColor(Scripts.color["black"]);

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 200);
	self.errorLabel:SetForeColor(Scripts.color["red"]);

	-- Button to remove player --
	self.removePlayerButton = Turbine.UI.Lotro.Button();
	self.removePlayerButton:SetParent(self);
	self.removePlayerButton:SetText(Scripts.translate("removePlayer"));
	self.removePlayerButton:SetSize(130, 30);
	self.removePlayerButton:SetPosition(self:GetWidth()/2 - self.removePlayerButton:GetWidth()/2, 240);
	self.removePlayerButton.Click = function( sender, args)
		if (self.playerSelect:GetValue() == nil) then
			self.errorLabel:SetText(Scripts.translate("nothingToRemove"));
			self.errorLabel:SetVisible(true);
			return;
		end
		Scripts.removePlayerCommand(self.playerSelect:GetValue());
	end

	-- Button to remove all player --
	self.removeAllPlayersButton = Turbine.UI.Lotro.Button();
	self.removeAllPlayersButton:SetParent(self);
	self.removeAllPlayersButton:SetText(Scripts.translate("removeAll"));
	self.removeAllPlayersButton:SetSize(130, 30);
	self.removeAllPlayersButton:SetPosition(self:GetWidth()/2 - self.removeAllPlayersButton:GetWidth()/2, 270);
	self.removeAllPlayersButton.Click = function( sender, args)
		self.errorLabel:SetVisible(false);
		self.removePlayerButton:SetVisible(false);
		self.removeAllPlayersButton:SetVisible(false);
		self.confirmationLabel:SetVisible(true);
		self.confirmButton:SetVisible(true);
		self.declineButton:SetVisible(true);
	end

	-- Delete all players confirmation label --
	self.confirmationLabel = Turbine.UI.Label();
	self.confirmationLabel:SetParent(self);
	self.confirmationLabel:SetVisible(false);
	self.confirmationLabel:SetText(Scripts.translate("removeAllConfirmation"));
	self.confirmationLabel:SetSize(200, 50);
	self.confirmationLabel:SetPosition(50, 130);
	self.confirmationLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);

	-- Button to decline action to remove all players --
	self.confirmButton = Turbine.UI.Lotro.Button();
	self.confirmButton:SetParent(self);
	self.confirmButton:SetVisible(false);
	self.confirmButton:SetText(Scripts.translate("no"));
	self.confirmButton:SetSize(100, 30);
	self.confirmButton:SetPosition(self:GetWidth()/2 - self.confirmButton:GetWidth()/2 + 60, 180);
	self.confirmButton.Click = function(sender, args)
		self.errorLabel:SetVisible(true);
		self.removePlayerButton:SetVisible(true);
		self.removeAllPlayersButton:SetVisible(true);
		self.confirmationLabel:SetVisible(false);
		self.confirmButton:SetVisible(false);
		self.declineButton:SetVisible(false);
	end

	-- Button to confirm action to remove all players --
	self.declineButton = Turbine.UI.Lotro.Button();
	self.declineButton:SetParent(self);
	self.declineButton:SetVisible(false);
	self.declineButton:SetText(Scripts.translate("yes"));
	self.declineButton:SetSize(100, 30);
	self.declineButton:SetPosition(self:GetWidth()/2 - self.declineButton:GetWidth()/2 - 60, 180);
	self.declineButton.Click = function(sender, args)
		Scripts.clearWindowCommand();
	end
end


-- Update player dropdown list --
function removePlayerWindow:UpdatePlayersList()
	self.playerSelect:ClearList();
	for i = 1, Scripts.Utility.getTableSize(Scripts.groupMembers) do
		self.playerSelect:AddItem(Scripts.groupMembers[tostring(i)].name, Scripts.groupMembers[tostring(i)].name);
	end
end


-- Set Visibility --
function removePlayerWindow:SetVisibility(state)
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
TeamOrganizer.UI.removePlayerWindow = removePlayerWindow();
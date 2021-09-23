if Scripts.settings["goldenTheme"] then loadGroupWindow = class(Turbine.UI.Lotro.GoldWindow); else loadGroupWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function loadGroupWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("TEXT_LOAD_GROUP"));
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

	-- Select group label --
	self.groupSelectLabel = Turbine.UI.Label();
	self.groupSelectLabel:SetParent(self);
	self.groupSelectLabel:SetVisible(true);
	self.groupSelectLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	self.groupSelectLabel:SetSize(200, 30);
	self.groupSelectLabel:SetPosition(50, 40);
	self.groupSelectLabel:SetText(Scripts.translate("TEXT_SELECT_GROUP"));

	-- Group select drop down list --
	self.groupSelect = TeamOrganizer.Utility.DropDownList();
	self.groupSelect:SetParent(self);
	self.groupSelect:SetDropRows(5);
	self.groupSelect:SetSize(200, 20);
	self.groupSelect:SetPosition(50, 70);
	self.groupSelect:SetZOrder(1001);
	self.groupSelect:SetVisible(true);
	self.groupSelect:SetBackColor(Scripts.color["black"]);
	self.groupSelect:SetTextColor(Scripts.color["white"]);
	self.groupSelect:SetCurrentBackColor(Scripts.color["black"]);

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(false);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 160);
	self.errorLabel:SetForeColor(Scripts.color["red"]);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);

	-- Button to remove player --
	self.loadGroupButton = Turbine.UI.Lotro.Button();
	self.loadGroupButton:SetParent(self);
	self.loadGroupButton:SetText(Scripts.translate("TEXT_LOAD_GROUP"));
	self.loadGroupButton:SetSize(130, 30);
	self.loadGroupButton:SetPosition(self:GetWidth()/2 - self.loadGroupButton:GetWidth()/2, 195);
	self.loadGroupButton.Click = function( sender, args)

		-- Make sure there are groups that can be loaded --
		if (self.groupSelect:GetValue() == nil) then
			self.errorLabel:SetText(Scripts.translate("TEXT_FAILED_TO_LOAD_GROUP"));
			self.errorLabel:SetVisible(true);
			return;
		end

		Scripts.loadGroupCommand(self.groupSelect:GetValue());
	end
end


-- Update player dropdown list --
function loadGroupWindow:updateGroupList()
	self.groupSelect:ClearList();
	for key,value in pairs(Scripts.savedGroupNames) do
		self.groupSelect:AddItem(value, value);
	end
end


-- Set Visibility --
function loadGroupWindow:SetVisibility(state)
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
TeamOrganizer.UI.loadGroupWindow = loadGroupWindow();
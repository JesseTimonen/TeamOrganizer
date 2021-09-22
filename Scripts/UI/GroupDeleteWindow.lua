if Scripts.settings["goldenTheme"] then deleteGroupWindow = class(Turbine.UI.Lotro.GoldWindow); else deleteGroupWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function deleteGroupWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("deleteGroup"));
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
	self.groupSelectLabel:SetText(Scripts.translate("selectGroup"));

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
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 160);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);

	-- Button to delete group --
	self.deleteGroupButton = Turbine.UI.Lotro.Button();
	self.deleteGroupButton:SetParent(self);
	self.deleteGroupButton:SetText(Scripts.translate("deleteGroup"));
	self.deleteGroupButton:SetSize(130, 30);
	self.deleteGroupButton:SetPosition(self:GetWidth()/2 - self.deleteGroupButton:GetWidth()/2, 195);
	self.deleteGroupButton.Click = function( sender, args)

		-- Check are there any groups to delete --
		if (self.groupSelect:GetValue() == nil) then
			self.errorLabel:SetText(Scripts.translate("nothingToDelete"));
			self.errorLabel:SetForeColor(Scripts.color["red"]);
			self.errorLabel:SetVisible(true);
			return;
		end

		-- Notify user that group has been deleted --
		self.errorLabel:SetText(Scripts.translate("deletedGroup") .. self.groupSelect:GetValue() .. "!");
		self.errorLabel:SetForeColor(Scripts.color["white"]);
		self.errorLabel:SetVisible(true);

		Scripts.Utility.tableRemoveKey(Scripts.savedGroupNames, self.groupSelect:GetValue());
		TeamOrganizer.UI.deleteGroupWindow:updateGroupList();
	end
end


-- Update Group dropdown list --
function deleteGroupWindow:updateGroupList()
	self.groupSelect:ClearList();
	for key,value in pairs(Scripts.savedGroupNames) do
		self.groupSelect:AddItem(value, value);
	end
end


-- Set Visibility --
function deleteGroupWindow:SetVisibility(state)
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
TeamOrganizer.UI.deleteGroupWindow = deleteGroupWindow();
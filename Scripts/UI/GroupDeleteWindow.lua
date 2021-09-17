if Scripts.settings["goldenTheme"] then deleteGroupWindow = class(Turbine.UI.Lotro.GoldWindow); else deleteGroupWindow = class(Turbine.UI.Lotro.Window); end

-- Constructor --
function deleteGroupWindow:Constructor()
	if Scripts.settings["goldenTheme"] then Turbine.UI.Lotro.GoldWindow.Constructor(self); else Turbine.UI.Lotro.Window.Constructor(self); end
	self:SetText(Scripts.translate("deleteGroup"));
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(300, 200);
	self:SetPosition(0, 0);
	self:SetZOrder(1000);
	self.KeyDown = function(sender,args)
		if (args.Action == 145) then
			self:SetVisible(false);
		end
	end

	-- Group select drop down list --
	self.groupSelect = TeamOrganizer.Utility.DropDownList();
	self.groupSelect:SetParent(self);
	self.groupSelect:SetDropRows(6);
	self.groupSelect:SetSize(200, 20);
	self.groupSelect:SetPosition(50, 50);
	self.groupSelect:SetZOrder(1001);
	self.groupSelect:SetVisible(true);
	self.groupSelect:SetBackColor(Turbine.UI.Color(0, 0, 0));
	self.groupSelect:SetTextColor(Turbine.UI.Color(1, 1, 1));
	self.groupSelect:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));

	-- Error label --
	self.errorLabel = Turbine.UI.Label();
	self.errorLabel:SetParent(self);
	self.errorLabel:SetVisible(true);
	self.errorLabel:SetSize(200, 30);
	self.errorLabel:SetPosition(50, 85);
	self.errorLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);

	-- Button to delete group --
	self.deleteGroupButton = Turbine.UI.Lotro.Button();
	self.deleteGroupButton:SetParent(self);
	self.deleteGroupButton:SetText(Scripts.translate("deleteGroup"));
	self.deleteGroupButton:SetSize(120, 30);
	self.deleteGroupButton:SetPosition(self:GetWidth()/2 - self.deleteGroupButton:GetWidth()/2, 120);
	self.deleteGroupButton.Click = function( sender, args)
		if (self.groupSelect:GetValue() == nil) then
			self.errorLabel:SetText(Scripts.translate("nothingToDelete"));
			self.errorLabel:SetForeColor(Scripts.color["red"]);
			return;
		end

		self.errorLabel:SetText(Scripts.translate("deletedGroup") .. self.groupSelect:GetValue() .. "!");
		self.errorLabel:SetForeColor(Scripts.color["white"]);

		Scripts.Utility.table_removeKey(Scripts.savedGroupNames, self.groupSelect:GetValue());
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
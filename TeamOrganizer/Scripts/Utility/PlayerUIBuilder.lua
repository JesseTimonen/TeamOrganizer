-- Build layout for icons --
function createClassIcon(parent, xPos, yPos, width, height, iconPath)
	local icon = Turbine.UI.Control();
	icon:SetParent(parent);
	icon:SetSize(width, height);
	icon:SetPosition(xPos, yPos);
	icon:SetBackground(iconPath);
	icon:SetVisible(false);

	return icon;
end

-- Build layout for labels --
function createLabel(parent, xPos, yPos, width, height, color, text)
	local label = Turbine.UI.Label();
	label:SetParent(parent);
	label:SetSize(width, height);
	label:SetPosition(xPos, yPos);
	label:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
	label:SetText(text);
	label:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	label:SetForeColor(color);
	label:SetVisible(false);

	return label;
end

-- Build layout for buttons --
function createButton(parent, xPos, yPos, width, height, color, alias)
	local quickSlot = Turbine.UI.Lotro.Quickslot();
	quickSlot:SetParent(parent);
	quickSlot:SetSize(width,height);
	quickSlot:SetPosition(xPos, yPos);
	quickSlot:SetZOrder(1);
	quickSlot:SetUseOnRightClick(false);
	quickSlot:SetVisible(false);
	
	local button = Turbine.UI.Control();
	button:SetParent(parent);
	button:SetSize(width,height);
	button:SetPosition(xPos, yPos);
	button:SetZOrder(2);
	button:SetBackColor(color);
	button:SetMouseVisible(false);
	button:SetVisible(false);

	local action = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, alias);
	quickSlot:SetShortcut(action);

	data = {}
	data["quickSlot"] = quickSlot;
	data["button"] = button;
	return data;
end
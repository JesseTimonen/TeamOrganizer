-- Build layout for customization options --
function createCustomizationOption(parent, xPos, yPos, text, tooltipText, keyValue)

	local label = Turbine.UI.Label();
	label:SetParent(parent);
	label:SetForeColor(Scripts.color["golden"]);
	label:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
	label:SetText(text);
	label:SetSize(240, 30);
	label:SetPosition(xPos, yPos);


	local labelTooltipHolder = Turbine.UI.Label();
	labelTooltipHolder:SetParent(parent);
	labelTooltipHolder:SetSize(95, 30);
	labelTooltipHolder:SetPosition(xPos, yPos);
	Scripts.Utility.TooltipAttach(labelTooltipHolder, tooltipText);


	local name = Turbine.UI.Label();
	name:SetParent(parent);
	name:SetSize(100, 30);
	name:SetPosition(xPos, yPos + 20);
	name:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	name:SetForeColor(Scripts.playerNameColor[keyValue]);
	name:SetText(Scripts.translate("TEXT_USERNAME"));


	local editButton = Turbine.UI.Lotro.Button();
	editButton:SetText(Scripts.translate("TEXT_EDIT"));
	editButton:SetParent(parent);
	editButton:SetSize(75, 30);
	editButton:SetPosition(xPos + 100, yPos + 20);
	editButton.Click = function( sender, args)
		if colorPicker ~= nil then
			colorPickerLastPositionX, colorPickerLastPositionY = colorPicker:GetPosition();
			colorPicker:Close();
		end

		colorPicker = TeamOrganizer.Utility.ColorPicker(name:GetForeColor(), "H");
		colorPicker:SetZOrder(9999);

		if (colorPickerLastPositionX ~= nil) then
			colorPicker:SetPosition(colorPickerLastPositionX, colorPickerLastPositionY);
		end

		colorPicker.ColorChanged = function(picker)
			name:SetForeColor(picker:GetColor());
		end

		colorPicker.Accepted = function(picker)
			name:SetForeColor(picker:GetColor());
			colorPicker:Close();
		end
	end


	local revertButton = Turbine.UI.Lotro.Button();
	revertButton:SetText(Scripts.translate("TEXT_REVERT"));
	revertButton:SetParent(parent);
	revertButton:SetSize(75, 30);
	revertButton:SetPosition(xPos + 180, yPos + 20);
	revertButton.Click = function( sender, args)
		-- Revert color back to what it was when plugin was loaded --
		name:SetForeColor(Scripts.playerNameColor[keyValue]);
	end


	local defaultButton = Turbine.UI.Lotro.Button();
	defaultButton:SetText(Scripts.translate("TEXT_DEFAULT"));
	defaultButton:SetParent(parent);
	defaultButton:SetSize(75, 30);
	defaultButton:SetPosition(xPos + 260, yPos + 20);
	defaultButton.Click = function( sender, args)
		-- Reset color to default settings --
		name:SetForeColor(Scripts.defaultPlayerNameColor[keyValue]);
	end


	-- Return created objects --
	data = {}
	data["label"] = label;
	data["name"] = name;
	data["editButton"] = editButton;
	data["revertButton"] = revertButton;
	data["defaultButton"] = defaultButton;
	return data;
end
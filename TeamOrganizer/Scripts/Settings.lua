plugin.GetOptionsPanel = function(self)

	-- Create Options Panel --
	optionsPanel = Turbine.UI.Control();
	optionsPanel:SetSize(500, 800);


	-- Language label --
	languageLabel = Turbine.UI.Label();
	languageLabel:SetParent(optionsPanel);
	languageLabel:SetText(translate("language", settings["language"]));
	languageLabel:SetSize(400, 30);
	languageLabel:SetPosition(0, 20);
	languageLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	languageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	languageLabel:SetForeColor(color["yellow"]);
	languageLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	languageLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	languageLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/optionsTitleBackground.tga"));


	-- Language Selection --
	local languages = { "English", "German", "French" };
	local radioButtons = {};
	local top = 60;

	for i = 1, #languages do
		radioButton = TeamOrganizer.Utility.RadioButton();
		radioButton:SetParent(optionsPanel);
		radioButton:SetPosition(50, top);
		radioButton:SetSize(300, 20);
		radioButton:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		radioButton:SetForeColor(color["golden"]);
		radioButton:SetText(languages[i]);
		if (string.lower(languages[i]) == settings["language"]) then radioButton:SetChecked(true); end
		radioButton.Clicked = function()
			settings["language"] = string.lower(languages[i]);
		end

		top = top + 20;
		table.insert(radioButtons, radioButton);
	end

	Utility.RadioButton.LinkPeers(radioButtons);


	-- General Settings --
	generalSettingLabel = Turbine.UI.Label();
	generalSettingLabel:SetParent(optionsPanel);
	generalSettingLabel:SetText(translate("generalSettings", settings["language"]));
	generalSettingLabel:SetSize(400, 30);
	generalSettingLabel:SetPosition(0, 150);
	generalSettingLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	generalSettingLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	generalSettingLabel:SetForeColor(color["yellow"]);
	generalSettingLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	generalSettingLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	generalSettingLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/optionsTitleBackground.tga"));


	-- Enable escape label --
	enableEscapeLabel = Turbine.UI.Label();
	enableEscapeLabel:SetParent(optionsPanel);
	enableEscapeLabel:SetSize(300, 30);
	enableEscapeLabel:SetPosition(80, 200);
	enableEscapeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableEscapeLabel:SetText(translate("enableEscape", settings["language"]));
	enableEscapeLabel:SetForeColor(color["golden"]);

	-- Checkbox for enable escape setting --
	enableEscapeCheckbox = Turbine.UI.Lotro.CheckBox();
	enableEscapeCheckbox:SetParent(optionsPanel);
	enableEscapeCheckbox:SetSize(20, 20);
	enableEscapeCheckbox:SetPosition(50, 199);
	enableEscapeCheckbox:SetChecked(settings["enableEscape"]);
	Utility.TooltipAttach(enableEscapeCheckbox, translate("enableEscapeTooltip", settings["language"]));


	-- Enable disband Button Label --
	enableDisbandLabel = Turbine.UI.Label();
	enableDisbandLabel:SetParent(optionsPanel);
	enableDisbandLabel:SetSize(300, 30);
	enableDisbandLabel:SetPosition(80, 230);
	enableDisbandLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableDisbandLabel:SetText(translate("enableDisband", settings["language"]));
	enableDisbandLabel:SetForeColor(color["golden"]);

	-- Checkbox for enable disband setting --
	enableDisbandCheckbox = Turbine.UI.Lotro.CheckBox();
	enableDisbandCheckbox:SetParent(optionsPanel);
	enableDisbandCheckbox:SetSize(20, 20);
	enableDisbandCheckbox:SetPosition(50, 229);
	enableDisbandCheckbox:SetChecked(settings["enableDisband"]);
	Utility.TooltipAttach(enableDisbandCheckbox, translate("enableDisbandTooltip", settings["language"]));


	-- Horizontal UI label --
	horizontalUILabel = Turbine.UI.Label();
	horizontalUILabel:SetParent(optionsPanel);
	horizontalUILabel:SetSize(300, 30);
	horizontalUILabel:SetPosition(80, 260);
	horizontalUILabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	horizontalUILabel:SetText(translate("horizontalUI", settings["language"]));
	horizontalUILabel:SetForeColor(color["golden"]);

	-- Checkbox for horizontal UI setting --
	horizontalUICheckbox = Turbine.UI.Lotro.CheckBox();
	horizontalUICheckbox:SetParent(optionsPanel);
	horizontalUICheckbox:SetSize(20, 20);
	horizontalUICheckbox:SetPosition(50, 259);
	horizontalUICheckbox:SetChecked(settings["horizontalWindow"]);
	Utility.TooltipAttach(horizontalUICheckbox, translate("horizontalUITooltip", settings["language"]));


	-- Golden window label --
	goldenWindowLabel = Turbine.UI.Label();
	goldenWindowLabel:SetParent(optionsPanel);
	goldenWindowLabel:SetSize(300, 30);
	goldenWindowLabel:SetPosition(80, 290);
	goldenWindowLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	goldenWindowLabel:SetText(translate("goldTheme", settings["language"]));
	goldenWindowLabel:SetForeColor(color["golden"]);

	-- Checkbox for golden window setting --
	goldenWindowCheckbox = Turbine.UI.Lotro.CheckBox();
	goldenWindowCheckbox:SetParent(optionsPanel);
	goldenWindowCheckbox:SetSize(20, 20);
	goldenWindowCheckbox:SetPosition(50, 289);
	goldenWindowCheckbox:SetChecked(settings["goldenTheme"]);
	Utility.TooltipAttach(goldenWindowCheckbox, translate("goldThemeTooltip", settings["language"]));


	-- Customization Settings --
	customizationLabel = Turbine.UI.Label();
	customizationLabel:SetParent(optionsPanel);
	customizationLabel:SetText(translate("customization", settings["language"]));
	customizationLabel:SetSize(400, 30);
	customizationLabel:SetPosition(0, 340);
	customizationLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	customizationLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	customizationLabel:SetForeColor(color["yellow"]);
	customizationLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	customizationLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	customizationLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/optionsTitleBackground.tga"));


	customization1 = Utility.createCustomizationOption(optionsPanel, 50, 390, translate("customizationLabelInParty", settings["language"]),  translate("customizationLabelInPartyTooltip", settings["language"]), "inParty");
	customization2 = Utility.createCustomizationOption(optionsPanel, 50, 450, translate("customizationLabelNotInParty", settings["language"]),  translate("customizationLabelNotInPartyTooltip", settings["language"]), "notInParty");
	customization3 = Utility.createCustomizationOption(optionsPanel, 50, 510, translate("customizationLabelInvited", settings["language"]),  translate("customizationLabelInvitedTooltip", settings["language"]), "invited");
	customization4 = Utility.createCustomizationOption(optionsPanel, 50, 570, translate("customizationLabelDeclined", settings["language"]),  translate("customizationLabelDeclinedTooltip", settings["language"]), "declined");
	customization5 = Utility.createCustomizationOption(optionsPanel, 50, 630, translate("customizationLabelInAnotherGroup", settings["language"]),  translate("customizationLabelInAnotherGroupTooltip", settings["language"]), "anotherGroup");
	customization6 = Utility.createCustomizationOption(optionsPanel, 50, 690, translate("customizationLabelOffline", settings["language"]),  translate("customizationLabelOfflineTooltip", settings["language"]), "offline");


	-- Save settings button --
	saveSettingsButton = Turbine.UI.Lotro.Button();
	saveSettingsButton:SetText(translate("save", settings["language"]));
	saveSettingsButton:SetParent(optionsPanel);
	saveSettingsButton:SetSize(125, 20);
	saveSettingsButton:SetPosition(50, 780);
	saveSettingsButton:SetZOrder(100);
	saveSettingsButton.Click = function( sender, args)
		settings["loadRequest"] = "previous group";
		saveSettings();
		saveCustomization();
		notification(translate("settingsSaved", settings["language"]));
		reloadPlugin();
	end

	-- Return View --
	return optionsPanel;
end
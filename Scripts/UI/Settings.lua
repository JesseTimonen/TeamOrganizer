plugin.GetOptionsPanel = function(self)

	-- Create options panel --
	optionsPanel = Turbine.UI.Control();
	optionsPanel:SetSize(500, 910);


	-- Language label --
	languageLabel = Turbine.UI.Label();
	languageLabel:SetParent(optionsPanel);
	languageLabel:SetText(Scripts.translate("TEXT_LANGUAGE"));
	languageLabel:SetSize(400, 30);
	languageLabel:SetPosition(0, 20);
	languageLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	languageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	languageLabel:SetForeColor(Scripts.color["yellow"]);
	languageLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	languageLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	languageLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/options_title_background.tga"));


	-- Language Selection --
	local languages = { "English", "German", "French" };
	local radioButtons = {};
	local top = 60;

	for i = 1, #languages do
		radioButton = TeamOrganizer.Utility.RadioButton();
		radioButton:SetParent(optionsPanel);
		radioButton:SetPosition(50, top);
		radioButton:SetSize(80, 20);
		radioButton:SetFont(Turbine.UI.Lotro.Font.TrajanPro15);
		radioButton:SetForeColor(Scripts.color["golden"]);
		radioButton:SetText(languages[i]);
		if (string.lower(languages[i]) == Scripts.settings["language"]) then radioButton:SetChecked(true); end
		radioButton.Clicked = function()
			Scripts.settings["language"] = string.lower(languages[i]);
		end
		
		top = top + 20;
		table.insert(radioButtons, radioButton);
	end

	Utility.RadioButton.LinkPeers(radioButtons);


	-- General Settings --
	generalSettingLabel = Turbine.UI.Label();
	generalSettingLabel:SetParent(optionsPanel);
	generalSettingLabel:SetText(Scripts.translate("TEXT_GENERAL_SETTINGS"));
	generalSettingLabel:SetSize(400, 30);
	generalSettingLabel:SetPosition(0, 150);
	generalSettingLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	generalSettingLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	generalSettingLabel:SetForeColor(Scripts.color["yellow"]);
	generalSettingLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	generalSettingLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	generalSettingLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/options_title_background.tga"));


	-- Golden window label --
	goldenWindowLabel = Turbine.UI.Label();
	goldenWindowLabel:SetParent(optionsPanel);
	goldenWindowLabel:SetSize(400, 30);
	goldenWindowLabel:SetPosition(80, 200);
	goldenWindowLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	goldenWindowLabel:SetText(Scripts.translate("TEXT_ENABLE_GOLD_THEME"));
	goldenWindowLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for golden window setting --
	goldenWindowCheckbox = Turbine.UI.Lotro.CheckBox();
	goldenWindowCheckbox:SetParent(optionsPanel);
	goldenWindowCheckbox:SetSize(400, 20);
	goldenWindowCheckbox:SetPosition(50, 199);
	goldenWindowCheckbox:SetChecked(Scripts.settings["goldenTheme"]);
	goldenWindowCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(goldenWindowCheckbox, Scripts.translate("TEXT_ENABLE_GOLD_THEME_TOOLTIP"));


	-- Force top label --
	forceTopLabel = Turbine.UI.Label();
	forceTopLabel:SetParent(optionsPanel);
	forceTopLabel:SetSize(400, 30);
	forceTopLabel:SetPosition(80, 230);
	forceTopLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	forceTopLabel:SetText(Scripts.translate("TEXT_ENABLE_FORCE_TOP"));
	forceTopLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for force top setting --
	forceTopCheckbox = Turbine.UI.Lotro.CheckBox();
	forceTopCheckbox:SetParent(optionsPanel);
	forceTopCheckbox:SetSize(400, 20);
	forceTopCheckbox:SetPosition(50, 229);
	forceTopCheckbox:SetChecked(Scripts.settings["forceTop"]);
	forceTopCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(forceTopCheckbox, Scripts.translate("TEXT_ENABLE_FORCE_TOP_TOOLTIP"));


	-- Enable escape label --
	enableEscapeLabel = Turbine.UI.Label();
	enableEscapeLabel:SetParent(optionsPanel);
	enableEscapeLabel:SetSize(400, 30);
	enableEscapeLabel:SetPosition(80, 260);
	enableEscapeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableEscapeLabel:SetText(Scripts.translate("TEXT_ENABLE_ESCAPE"));
	enableEscapeLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable escape setting --
	enableEscapeCheckbox = Turbine.UI.Lotro.CheckBox();
	enableEscapeCheckbox:SetParent(optionsPanel);
	enableEscapeCheckbox:SetSize(400, 20);
	enableEscapeCheckbox:SetPosition(50, 259);
	enableEscapeCheckbox:SetChecked(Scripts.settings["enableEscape"]);
	enableEscapeCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(enableEscapeCheckbox, Scripts.translate("TEXT_ENABLE_ESCAPE_TOOLTIP"));


	-- Horizontal UI label --
	horizontalUILabel = Turbine.UI.Label();
	horizontalUILabel:SetParent(optionsPanel);
	horizontalUILabel:SetSize(400, 30);
	horizontalUILabel:SetPosition(80, 290);
	horizontalUILabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	horizontalUILabel:SetText(Scripts.translate("TEXT_ENABLE_HORIZONTAL_UI"));
	horizontalUILabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for horizontal UI setting --
	horizontalUICheckbox = Turbine.UI.Lotro.CheckBox();
	horizontalUICheckbox:SetParent(optionsPanel);
	horizontalUICheckbox:SetSize(400, 20);
	horizontalUICheckbox:SetPosition(50, 289);
	horizontalUICheckbox:SetChecked(Scripts.settings["horizontalWindow"]);
	horizontalUICheckbox:SetText("");
	Scripts.Utility.TooltipAttach(horizontalUICheckbox, Scripts.translate("TEXT_ENABLE_HORIZONTAL_UI_TOOLTIP"));


	-- Enable disband button Label --
	enableDisbandLabel = Turbine.UI.Label();
	enableDisbandLabel:SetParent(optionsPanel);
	enableDisbandLabel:SetSize(400, 30);
	enableDisbandLabel:SetPosition(80, 320);
	enableDisbandLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableDisbandLabel:SetText(Scripts.translate("TEXT_ENABLE_DISBAND"));
	enableDisbandLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable disband setting --
	enableDisbandCheckbox = Turbine.UI.Lotro.CheckBox();
	enableDisbandCheckbox:SetParent(optionsPanel);
	enableDisbandCheckbox:SetSize(400, 20);
	enableDisbandCheckbox:SetPosition(50, 319);
	enableDisbandCheckbox:SetChecked(Scripts.settings["enableDisband"]);
	enableDisbandCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(enableDisbandCheckbox, Scripts.translate("TEXT_ENABLE_DISBAND_TOOLTIP"));


	-- Enable dismiss button Label --
	enableDismissLabel = Turbine.UI.Label();
	enableDismissLabel:SetParent(optionsPanel);
	enableDismissLabel:SetSize(400, 30);
	enableDismissLabel:SetPosition(80, 350);
	enableDismissLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableDismissLabel:SetText(Scripts.translate("TEXT_ENABLE_DISMISS"));
	enableDismissLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable dismiss setting --
	enableDismissCheckbox = Turbine.UI.Lotro.CheckBox();
	enableDismissCheckbox:SetParent(optionsPanel);
	enableDismissCheckbox:SetSize(400, 20);
	enableDismissCheckbox:SetPosition(50, 349);
	enableDismissCheckbox:SetChecked(Scripts.settings["enableDismiss"]);
	enableDismissCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(enableDismissCheckbox, Scripts.translate("TEXT_ENABLE_DISMISS_TOOLTIP"));


	-- Enable promote button Label --
	enablePromoteLabel = Turbine.UI.Label();
	enablePromoteLabel:SetParent(optionsPanel);
	enablePromoteLabel:SetSize(400, 30);
	enablePromoteLabel:SetPosition(80, 380);
	enablePromoteLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enablePromoteLabel:SetText(Scripts.translate("TEXT_ENABLE_PROMOTE"));
	enablePromoteLabel:SetForeColor(Scripts.color["golden"]);
	
	-- Checkbox for enable promote setting --
	enablePromoteCheckbox = Turbine.UI.Lotro.CheckBox();
	enablePromoteCheckbox:SetParent(optionsPanel);
	enablePromoteCheckbox:SetSize(400, 20);
	enablePromoteCheckbox:SetPosition(50, 379);
	enablePromoteCheckbox:SetChecked(Scripts.settings["enablePromote"]);
	enablePromoteCheckbox:SetText("");
	Scripts.Utility.TooltipAttach(enablePromoteCheckbox, Scripts.translate("TEXT_ENABLE_PROMOTE_TOOLTIP"));


	-- Customization Settings --
	customizationLabel = Turbine.UI.Label();
	customizationLabel:SetParent(optionsPanel);
	customizationLabel:SetText(Scripts.translate("TEXT_CUSTOMIZATION"));
	customizationLabel:SetSize(400, 30);
	customizationLabel:SetPosition(0, 430);
	customizationLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	customizationLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	customizationLabel:SetForeColor(Scripts.color["yellow"]);
	customizationLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	customizationLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	customizationLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/options_title_background.tga"));


	customization1 = createCustomizationOption(optionsPanel, 50, 480, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_IN_PARTY", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_IN_PARTY_TOOLTIP", Scripts.settings["language"]), "inParty");
	customization2 = createCustomizationOption(optionsPanel, 50, 540, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_NOT_IN_PARTY", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_NOT_IN_PARTY_TOOLTIP", Scripts.settings["language"]), "notInParty");
	customization3 = createCustomizationOption(optionsPanel, 50, 600, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_INVITED", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_INVITED_TOOLTIP", Scripts.settings["language"]), "invited");
	customization4 = createCustomizationOption(optionsPanel, 50, 660, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_DECLINED", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_DECLINED_TOOLTIP", Scripts.settings["language"]), "declined");
	customization5 = createCustomizationOption(optionsPanel, 50, 720, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_IN_ANOTHER_GROUP", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_IN_ANOTHER_GROUP_TOOLTIP", Scripts.settings["language"]), "anotherGroup");
	customization6 = createCustomizationOption(optionsPanel, 50, 780, Scripts.translate("TEXT_CUSTOMIZATION_LABEL_OFFLINE", Scripts.settings["language"]),  Scripts.translate("TEXT_CUSTOMIZATION_LABEL_OFFLINE_TOOLTIP", Scripts.settings["language"]), "offline");


	-- Save settings button --
	saveSettingsButton = Turbine.UI.Lotro.Button();
	saveSettingsButton:SetText(Scripts.translate("TEXT_SAVE"));
	saveSettingsButton:SetParent(optionsPanel);
	saveSettingsButton:SetSize(125, 20);
	saveSettingsButton:SetPosition(50, 870);
	saveSettingsButton:SetZOrder(100);
	saveSettingsButton.Click = function( sender, args)
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		Scripts.saveCustomization();
		Scripts.notification(Scripts.translate("TEXT_SETTINGS_SAVED"));
		Scripts.reloadPlugin();
	end

	-- Return View --
	return optionsPanel;
end
plugin.GetOptionsPanel = function(self)

	-- Create Options Panel --
	optionsPanel = Turbine.UI.Control();
	optionsPanel:SetSize(500, 880);


	-- Language label --
	languageLabel = Turbine.UI.Label();
	languageLabel:SetParent(optionsPanel);
	languageLabel:SetText(Scripts.translate("language"));
	languageLabel:SetSize(400, 30);
	languageLabel:SetPosition(0, 20);
	languageLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	languageLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	languageLabel:SetForeColor(Scripts.color["yellow"]);
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
	generalSettingLabel:SetText(Scripts.translate("generalSettings"));
	generalSettingLabel:SetSize(400, 30);
	generalSettingLabel:SetPosition(0, 150);
	generalSettingLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	generalSettingLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	generalSettingLabel:SetForeColor(Scripts.color["yellow"]);
	generalSettingLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	generalSettingLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	generalSettingLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/optionsTitleBackground.tga"));













	-- Golden window label --
	goldenWindowLabel = Turbine.UI.Label();
	goldenWindowLabel:SetParent(optionsPanel);
	goldenWindowLabel:SetSize(300, 30);
	goldenWindowLabel:SetPosition(80, 200);
	goldenWindowLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	goldenWindowLabel:SetText(Scripts.translate("goldTheme"));
	goldenWindowLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for golden window setting --
	goldenWindowCheckbox = Turbine.UI.Lotro.CheckBox();
	goldenWindowCheckbox:SetParent(optionsPanel);
	goldenWindowCheckbox:SetSize(20, 20);
	goldenWindowCheckbox:SetPosition(50, 199);
	goldenWindowCheckbox:SetChecked(Scripts.settings["goldenTheme"]);
	Scripts.Utility.TooltipAttach(goldenWindowCheckbox, Scripts.translate("goldThemeTooltip"));


	-- Force top label --
	forceTopLabel = Turbine.UI.Label();
	forceTopLabel:SetParent(optionsPanel);
	forceTopLabel:SetSize(300, 30);
	forceTopLabel:SetPosition(80, 230);
	forceTopLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	forceTopLabel:SetText(Scripts.translate("forceTop"));
	forceTopLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for force top setting --
	forceTopCheckbox = Turbine.UI.Lotro.CheckBox();
	forceTopCheckbox:SetParent(optionsPanel);
	forceTopCheckbox:SetSize(20, 20);
	forceTopCheckbox:SetPosition(50, 229);
	forceTopCheckbox:SetChecked(Scripts.settings["forceTop"]);
	Scripts.Utility.TooltipAttach(forceTopCheckbox, Scripts.translate("forceTopTooltip"));






	-- Enable escape label --
	enableEscapeLabel = Turbine.UI.Label();
	enableEscapeLabel:SetParent(optionsPanel);
	enableEscapeLabel:SetSize(300, 30);
	enableEscapeLabel:SetPosition(80, 260);
	enableEscapeLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableEscapeLabel:SetText(Scripts.translate("enableEscape"));
	enableEscapeLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable escape setting --
	enableEscapeCheckbox = Turbine.UI.Lotro.CheckBox();
	enableEscapeCheckbox:SetParent(optionsPanel);
	enableEscapeCheckbox:SetSize(20, 20);
	enableEscapeCheckbox:SetPosition(50, 259);
	enableEscapeCheckbox:SetChecked(Scripts.settings["enableEscape"]);
	Scripts.Utility.TooltipAttach(enableEscapeCheckbox, Scripts.translate("enableEscapeTooltip"));





	-- Horizontal UI label --
	horizontalUILabel = Turbine.UI.Label();
	horizontalUILabel:SetParent(optionsPanel);
	horizontalUILabel:SetSize(300, 30);
	horizontalUILabel:SetPosition(80, 290);
	horizontalUILabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	horizontalUILabel:SetText(Scripts.translate("horizontalUI"));
	horizontalUILabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for horizontal UI setting --
	horizontalUICheckbox = Turbine.UI.Lotro.CheckBox();
	horizontalUICheckbox:SetParent(optionsPanel);
	horizontalUICheckbox:SetSize(20, 20);
	horizontalUICheckbox:SetPosition(50, 289);
	horizontalUICheckbox:SetChecked(Scripts.settings["horizontalWindow"]);
	Scripts.Utility.TooltipAttach(horizontalUICheckbox, Scripts.translate("horizontalUITooltip"));




	-- Enable disband button Label --
	enableDisbandLabel = Turbine.UI.Label();
	enableDisbandLabel:SetParent(optionsPanel);
	enableDisbandLabel:SetSize(300, 30);
	enableDisbandLabel:SetPosition(80, 320);
	enableDisbandLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableDisbandLabel:SetText(Scripts.translate("enableDisband"));
	enableDisbandLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable disband setting --
	enableDisbandCheckbox = Turbine.UI.Lotro.CheckBox();
	enableDisbandCheckbox:SetParent(optionsPanel);
	enableDisbandCheckbox:SetSize(20, 20);
	enableDisbandCheckbox:SetPosition(50, 319);
	enableDisbandCheckbox:SetChecked(Scripts.settings["enableDisband"]);
	Scripts.Utility.TooltipAttach(enableDisbandCheckbox, Scripts.translate("enableDisbandTooltip"));




	-- Enable dismiss button Label --
	enableDismissLabel = Turbine.UI.Label();
	enableDismissLabel:SetParent(optionsPanel);
	enableDismissLabel:SetSize(300, 30);
	enableDismissLabel:SetPosition(80, 350);
	enableDismissLabel:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	enableDismissLabel:SetText(Scripts.translate("enableDismiss"));
	enableDismissLabel:SetForeColor(Scripts.color["golden"]);

	-- Checkbox for enable dismiss setting --
	enableDismissCheckbox = Turbine.UI.Lotro.CheckBox();
	enableDismissCheckbox:SetParent(optionsPanel);
	enableDismissCheckbox:SetSize(20, 20);
	enableDismissCheckbox:SetPosition(50, 349);
	enableDismissCheckbox:SetChecked(Scripts.settings["enableDismiss"]);
	Scripts.Utility.TooltipAttach(enableDismissCheckbox, Scripts.translate("enableDismissTooltip"));
















	-- Customization Settings --
	customizationLabel = Turbine.UI.Label();
	customizationLabel:SetParent(optionsPanel);
	customizationLabel:SetText(Scripts.translate("customization"));
	customizationLabel:SetSize(400, 30);
	customizationLabel:SetPosition(0, 400);
	customizationLabel:SetFont(Turbine.UI.Lotro.Font.TrajanPro18);
	customizationLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	customizationLabel:SetForeColor(Scripts.color["yellow"]);
	customizationLabel:SetFontStyle(Turbine.UI.FontStyle.Outline);
	customizationLabel:SetBlendMode(Turbine.UI.BlendMode.AlphaBlend);
	customizationLabel:SetBackground(Turbine.UI.Graphic("TeamOrganizer/Images/optionsTitleBackground.tga"));


	customization1 = createCustomizationOption(optionsPanel, 50, 450, Scripts.translate("customizationLabelInParty", Scripts.settings["language"]),  Scripts.translate("customizationLabelInPartyTooltip", Scripts.settings["language"]), "inParty");
	customization2 = createCustomizationOption(optionsPanel, 50, 510, Scripts.translate("customizationLabelNotInParty", Scripts.settings["language"]),  Scripts.translate("customizationLabelNotInPartyTooltip", Scripts.settings["language"]), "notInParty");
	customization3 = createCustomizationOption(optionsPanel, 50, 570, Scripts.translate("customizationLabelInvited", Scripts.settings["language"]),  Scripts.translate("customizationLabelInvitedTooltip", Scripts.settings["language"]), "invited");
	customization4 = createCustomizationOption(optionsPanel, 50, 630, Scripts.translate("customizationLabelDeclined", Scripts.settings["language"]),  Scripts.translate("customizationLabelDeclinedTooltip", Scripts.settings["language"]), "declined");
	customization5 = createCustomizationOption(optionsPanel, 50, 690, Scripts.translate("customizationLabelInAnotherGroup", Scripts.settings["language"]),  Scripts.translate("customizationLabelInAnotherGroupTooltip", Scripts.settings["language"]), "anotherGroup");
	customization6 = createCustomizationOption(optionsPanel, 50, 750, Scripts.translate("customizationLabelOffline", Scripts.settings["language"]),  Scripts.translate("customizationLabelOfflineTooltip", Scripts.settings["language"]), "offline");


	-- Save settings button --
	saveSettingsButton = Turbine.UI.Lotro.Button();
	saveSettingsButton:SetText(Scripts.translate("save"));
	saveSettingsButton:SetParent(optionsPanel);
	saveSettingsButton:SetSize(125, 20);
	saveSettingsButton:SetPosition(50, 840);
	saveSettingsButton:SetZOrder(100);
	saveSettingsButton.Click = function( sender, args)
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		Scripts.saveCustomization();
		Scripts.notification(Scripts.translate("settingsSaved"));
		Scripts.reloadPlugin();
	end

	-- Return View --
	return optionsPanel;
end
-- Sends notifications to chat --
function notification(message)
	if (message == nil or message == "") then return end
	Turbine.Shell.WriteLine(rgb["pluginName"] .. translate("pluginName", settings["language"]) .. rgb["clear"] .. ": " .. message);
end

-- Sends error message to main window --
function errorMessage(message)
	if (message == nil or message == "") then return end
	errorLabel:SetText(message);
end
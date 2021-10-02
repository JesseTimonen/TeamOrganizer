-- Sends notifications to chat --
function notification(message)
	Turbine.Shell.WriteLine(rgb["pluginName"] .. translate("TEXT_PLUGIN_NAME") .. rgb["clear"] .. ": " .. tostring(message));
end


-- Sends error message to main plugin window --
function errorMessage(message)
	UI.errorLabel:SetVisible(true);

	if (type(message) == "string") then
		UI.errorLabel:SetText(message);
	else
		UI.errorLabel:SetText(translate("TEXT_UNKNOWN_ERROR"));
	end
end
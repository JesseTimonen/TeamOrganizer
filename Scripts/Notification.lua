-- Sends notifications to chat --
function notification(message)
	if (type(message) == "string") then
		Turbine.Shell.WriteLine(rgb["pluginName"] .. translate("pluginName") .. rgb["clear"] .. ": " .. message);
	end
end


-- Sends error message to main plugin window --
function errorMessage(message)
	if (type(message) == "string") then
		UI.errorLabel:SetText(message);
	else
		UI.errorLabel:SetText(translate("unknownError"));
	end
end
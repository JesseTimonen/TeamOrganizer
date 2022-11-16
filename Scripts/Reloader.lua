import "Turbine";
import "Turbine.UI";

-- Allows the plugin to reload itself --
-- Called by reloader plugin --
window = Turbine.UI.Window();
window.Update = function()
	window:SetWantsUpdates(false);
	Turbine.PluginManager.UnloadScriptState("Team Organizer");
	Turbine.PluginManager.LoadPlugin("Team Organizer");
end
window:SetWantsUpdates(true);
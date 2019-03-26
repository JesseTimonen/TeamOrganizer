import "Turbine";
import "Turbine.UI";

window = Turbine.UI.Window();
window.Update = function()
	window:SetWantsUpdates(false);
	Turbine.PluginManager.UnloadScriptState("Team Organizer");
	Turbine.PluginManager.LoadPlugin("Team Organizer");
end
window:SetWantsUpdates(true);
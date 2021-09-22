-- Activate Plugin --
Plugins[pluginName].Load = function()

	-- Load Group members --
	loadGroup();
	if (groupMembers == nil) then groupMembers = {}; end
	
	-- Prevent plugin from activating code below if it was internally reloaded --
	local loadedPlugins = Turbine.PluginManager:GetLoadedPlugins();
	for i = 1, #loadedPlugins do
		if loadedPlugins[i].Name == pluginReloaderName then
			return;
		end
	end

	-- Display plugin loaded message --
	notification(translate("loaded") .. " " .. Plugins[pluginName]:GetVersion() .. " " .. translate("credits"));
end


-- Unload Plugin --
Plugins[pluginName].Unload = function()
	-- Check was plugin unactivated because it was reloaded --
	local loadedPlugins = Turbine.PluginManager:GetLoadedPlugins();
	local internalReload = false;
	for i = 1, #loadedPlugins do
		if loadedPlugins[i].Name == pluginReloaderName then
			internalReload = true;
		end
	end

	if (not internalReload) then
		-- Save the previous group the player played with --
		settings["loadRequest"] = "previous group";

		-- Display plugin unloaded message --
		notification(translate("unloaded"));
	end

	-- Save settings --
	saveSettings();
end

-- Load settings --
loadSettings();
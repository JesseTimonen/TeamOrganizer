-- Activate Plugin --
Plugins[pluginName].Load = function(self, sender, args)

	-- Load group and update UI --
	groupMembers = loadGroup();

	-- Prevent plugin from activating code below if it was internally reloaded --
	local loadedPlugins = Turbine.PluginManager:GetLoadedPlugins();
	for i = 1, #loadedPlugins do
		if loadedPlugins[i].Name == pluginReloaderName then
			return;
		end
	end

	-- Hide error message when plugin is loaded the first time --
	errorLabel:SetVisible(false);

	-- Show plugin loaded message --
	notification(translate("loaded", settings["language"]) .. " " .. Plugins[pluginName]:GetVersion() .. " " .. translate("credits", settings["language"]));

	-- There was a bug with GetParty() not returning the group properly the first time plugin was loaded, reloading plugin makes sure it will work properly --
	reloadPlugin();
end

-- Unload Plugin --
Plugins[pluginName].Unload = function(self, sender, args)
	-- Close color picker --
	if colorPicker ~= nil then
		colorPicker:Close();
	end

	-- Save windows position --
	windowPosition["xPos"] = tostring(mainWindow:GetLeft());
	windowPosition["yPos"] = tostring(mainWindow:GetTop());
	saveData(Turbine.DataScope.Character, "TeamOrganizer_WindowPosition", windowPosition);
	
	-- Prevent plugin from activating code below if it was internally reloaded --
	local loadedPlugins = Turbine.PluginManager:GetLoadedPlugins();
	for i = 1, #loadedPlugins do
		if loadedPlugins[i].Name == pluginReloaderName then
			return;
		end
	end
	
	-- Save previous group player played with and send plugin unloaded message --
	saveData(Turbine.DataScope.Server, "TeamOrganizer_LoadRequest", "Previous Group");
	notification(translate("unloaded", settings["language"]));
end
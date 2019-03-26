-- Save Data --
function saveData(dataScope, key, value)
	Turbine.PluginData.Save(dataScope, key, value);
end

-- Load group information --
function loadGroup()
	-- Check if player have given a load request --
	loadRequest = Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_LoadRequest");

	-- Reset load Request --
	saveData(Turbine.DataScope.Server, "TeamOrganizer_LoadRequest", nil);

	-- Return the previous group player played with --
	if loadRequest == "Previous Group" then
		return Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers");
	end

	-- Return nothing since we want to clear the window --
	if loadRequest == "Clear Groups" then
		return nil;
	end

	-- If load request was found load the team being requested --
	if loadRequest ~= nil then
		-- Load the requested group --
		local _groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_CustomData_" .. loadRequest);

		-- See if requested group exists --
		if _groupMembers ~= nil then
			-- Group loaded successfully --
			notification(translate("groupLoaded", settings["language"]) .. " " .. loadRequest);
			saveData(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers", _groupMembers);
			return _groupMembers;
		else
			-- Failed to load group --
			notification(rgb["error"] .. translate("groupLoadFailed", settings["language"]) .. " " .. loadRequest .. rgb["clear"]);
			errorMessage(translate("groupLoadFailedError", settings["language"]));
			return Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers");
		end
	end

	-- If load request is empty get previous group player played with --
	if loadRequest == nil then
		return Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_GroupMembers");
	end

	-- If all fails return nothing --
	return nil;
end


-- Load Settings --
function loadSettings()
	-- Load window position
	local _windowPosition = Turbine.PluginData.Load(Turbine.DataScope.Character, "TeamOrganizer_WindowPosition");
	if _windowPosition ~= nil then windowPosition = _windowPosition; end

	-- Load settings --
	local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_Settings");
	if _settings ~= nil then settings = _settings; end

	-- Load customization settings --
	local _customization = Turbine.PluginData.Load(Turbine.DataScope.Server, "TeamOrganizer_customization");
	if _customization ~= nil then
		playerNameColor = {
			inParty = toColor(_customization["inParty"]["red"], _customization["inParty"]["green"], _customization["inParty"]["blue"]),
			notInParty = toColor(_customization["notInParty"]["red"], _customization["notInParty"]["green"], _customization["notInParty"]["blue"]),
			invited = toColor(_customization["invited"]["red"], _customization["invited"]["green"], _customization["invited"]["blue"]),
			declined = toColor(_customization["declined"]["red"], _customization["declined"]["green"], _customization["declined"]["blue"]),
			anotherGroup = toColor(_customization["anotherGroup"]["red"], _customization["anotherGroup"]["green"], _customization["anotherGroup"]["blue"]),
			offline = toColor(_customization["offline"]["red"], _customization["offline"]["green"], _customization["offline"]["blue"])
		}
	end
end

-- Function is required to fix an issue with german/french clients using "," instead of "." in decimals --
function toColor(r, g, b)
	if clientLanguage == "german" or clientLanguage == "french" then
		r = r:gsub("%.", ",");
		g = g:gsub("%.", ",");
		b = b:gsub("%.", ",");
	end

	return Turbine.UI.Color(tonumber(r), tonumber(g), tonumber(b));
end

-- Load settings --
loadSettings();
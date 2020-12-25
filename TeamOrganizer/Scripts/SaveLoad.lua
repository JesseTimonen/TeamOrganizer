-- Save Data --
function save(dataScope, key, value)
    Turbine.PluginData.Save(getDataScope(dataScope), key, value);
end


-- Load data --
function load(dataScope, key)
    return Turbine.PluginData.Load(getDataScope(dataScope), key);
end


-- Parse datascope from string --
function getDataScope(dataScope)
    if (string.lower(dataScope) == "server") then
        return Turbine.DataScope.Server;
    elseif (string.lower(dataScope) == "character") then
        return Turbine.DataScope.Character;
	end

    return Turbine.DataScope.Server;
end


-- Load group information --
function loadGroup()
	-- Check if player have given a load request --
	loadRequest = settings["loadRequest"];

	-- Reset load Request --
	settings["loadRequest"] = nil;

	-- Check if load request is previous group --
	if loadRequest == "previous group" then
		return load("server", groupMembersFileName);
	end

	-- Return an empty group if load request was to clear the group --
	if loadRequest == "clear group" then
		return nil;
	end

	-- If load request was found load the team being requested --
	if loadRequest ~= nil then
		-- Load the requested group --
		local _groupMembers = load("server", customGroupFileName .. loadRequest);

		-- See if requested group exists --
		if _groupMembers ~= nil then
			-- Group loaded successfully --
			notification(translate("groupLoaded") .. loadRequest);
			save("server", groupMembersFileName, _groupMembers);
			return _groupMembers;
		else
			-- Failed to load group --
			notification(rgb["error"] .. translate("groupLoadFailed") .. loadRequest .. rgb["clear"]);
			errorMessage(translate("groupLoadFailedError"));
			Utility.table_removeKey(savedGroupNames, loadRequest);
			return load("server", groupMembersFileName);
		end
	end

	-- If load request is empty then get the previous group the player played with --
	if loadRequest == nil then
		return load("server", groupMembersFileName);
	end

	-- If all fails return an empty group --
	return nil;
end


function loadSettings()
	-- Load Settings and customization --
	local _settings = load("server", settingsFileName);
	local _customization = load("server", customizationFileName);
	local _savedGroupNames = load("server", savedGroupNamesFileName);

	-- Apply settings --
	if _settings ~= nil then settings = _settings; end

	-- Apply saved groups data --
	if _savedGroupNames ~= nil then savedGroupNames = _savedGroupNames; end

	-- Apply customization --
	if _customization ~= nil then
		playerNameColor = {
			inParty = toColor(_customization["inParty"]["red"], _customization["inParty"]["green"], _customization["inParty"]["blue"]),
			notInParty = toColor(_customization["notInParty"]["red"], _customization["notInParty"]["green"], _customization["notInParty"]["blue"]),
			invited = toColor(_customization["invited"]["red"], _customization["invited"]["green"], _customization["invited"]["blue"]),
			declined = toColor(_customization["declined"]["red"], _customization["declined"]["green"], _customization["declined"]["blue"]),
			anotherGroup = toColor(_customization["anotherGroup"]["red"], _customization["anotherGroup"]["green"], _customization["anotherGroup"]["blue"]),
			offline = toColor(_customization["offline"]["red"], _customization["offline"]["green"], _customization["offline"]["blue"])
		};
	end
end


-- Turns RGB values to turbine color objects --
function toColor(r, g, b)
	-- Fix for german/french clients using "," instead of "." in decimals --
	if clientLanguage == "german" or clientLanguage == "french" then
		r = r:gsub("%.", ",");
		g = g:gsub("%.", ",");
		b = b:gsub("%.", ",");
	end

	return Turbine.UI.Color(tonumber(r), tonumber(g), tonumber(b));
end


function saveSettings()
	-- Return if setting elements don't exist (tested with one of the checkboxes) --
	if (UI.enableEscapeCheckbox == nil) then return end

	-- Get settings --
	settings["windowPosition"]["xPos"] = tostring(UI.mainWindow:GetLeft());
	settings["windowPosition"]["yPos"] = tostring(UI.mainWindow:GetTop());
	settings["enableEscape"] = UI.enableEscapeCheckbox:IsChecked();
	settings["enableDisband"] = UI.enableDisbandCheckbox:IsChecked();
	settings["enableDismiss"] = UI.enableDismissCheckbox:IsChecked();
	settings["enablePromote"] = UI.enablePromoteCheckbox:IsChecked();
	settings["horizontalWindow"] = UI.horizontalUICheckbox:IsChecked();
	settings["forceTop"] = UI.forceTopCheckbox:IsChecked();
	settings["goldenTheme"] = UI.goldenWindowCheckbox:IsChecked();
	
	-- Save new Settings --
	save("server", settingsFileName, settings);
	save("server", savedGroupNamesFileName, savedGroupNames);
end


function saveCustomization()
	local _customization = {
		inParty = {
			red = numberToStringMinMax(UI.customization1["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization1["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization1["name"]:GetForeColor().B, 0, 1)
		},
		notInParty = {
			red = numberToStringMinMax(UI.customization2["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization2["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization2["name"]:GetForeColor().B, 0, 1)
		},
		invited = {
			red = numberToStringMinMax(UI.customization3["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization3["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization3["name"]:GetForeColor().B, 0, 1)
		},
		declined = {
			red = numberToStringMinMax(UI.customization4["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization4["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization4["name"]:GetForeColor().B, 0, 1)
		},
		anotherGroup = {
			red = numberToStringMinMax(UI.customization5["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization5["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization5["name"]:GetForeColor().B, 0, 1)
		},
		offline = {
			red = numberToStringMinMax(UI.customization6["name"]:GetForeColor().R, 0, 1),
			green = numberToStringMinMax(UI.customization6["name"]:GetForeColor().G, 0, 1),
			blue = numberToStringMinMax(UI.customization6["name"]:GetForeColor().B, 0, 1)
		}
	};

	-- Save new customization options --
	save("server", customizationFileName, _customization);
end


-- Turns strings to numbers between min and max value --
function numberToStringMinMax(value, min, max)
	if value == nil then return tostring(min); end
	if value < min then return tostring(min); end
	if value > max then return tostring(max); end
	return tostring(value):gsub(",", ".");
end
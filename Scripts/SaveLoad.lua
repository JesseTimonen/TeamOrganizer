-- Load group information --
function loadGroup()
	-- Check if player has given a load request --
	local loadRequest = settings["loadRequest"];

	-- Reset settings load Request to default --
	settings["loadRequest"] = "previous group";

	-- Get Player's party --
	party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();

	-- Return previous saved group if load request was "previous group" --
	if loadRequest == "previous group" then
		groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, groupMembersFileName);
		return;
	end

	-- Return an empty group if load request was "clear group" --
	if loadRequest == "clear group" then
		groupMembers = {};
		return;
	end

	-- Return current party if load request was "current group" --
	if loadRequest == "current group" then
		if party == nil then
			-- No party found, return previous group --
			errorMessage(translate("TEXT_NO_PARTY"));
			groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, groupMembersFileName);
			return;
		else
			-- Load current party memebers --
			local offset = 0;

			-- Get players --
			for i = 1, party:GetMemberCount() do
				local member = Turbine.Object();
				member.name = party:GetMember(i):GetName();
				member.class = tostring(party:GetMember(i):GetClass());

				-- Avoid adding plugin owner into the table --
				if (member.name ~= playerName) then
					-- We have to save index as a string, since some clients turn "." into "," which causes errors when loading data --
					groupMembers[tostring(i - offset)] = member;
				else
					-- Offset players when plugin owner is found --
					offset = 1;
				end
			end

			-- Save party members to prevent losing data when disconnecting or switching characters --
			Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, groupMembers);
			return;
		end
	end

	-- If load request was found load the team being requested --
	if loadRequest ~= nil then
		-- Load the requested group --
		local _groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, customGroupFileName .. loadRequest);

		-- See if requested group exists --
		if _groupMembers ~= nil then
			-- Group loaded successfully --
			notification(translate("TEXT_GROUP_LOADED") .. loadRequest);
			Turbine.PluginData.Save(Turbine.DataScope.Server, groupMembersFileName, _groupMembers);
			groupMembers = _groupMembers;
			return;
		else
			-- Failed to load group, return previous group --
			notification(rgb["error"] .. translate("TEXT_FAILED_TO_LOAD_GROUP_DETAILED") .. loadRequest .. rgb["clear"]);
			errorMessage(translate("TEXT_FAILED_TO_LOAD_GROUP"));
			Utility.tableRemoveKey(savedGroupNames, loadRequest);
			groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, groupMembersFileName);
			return;
		end
	end

	-- If all fails return previous group --

	groupMembers = Turbine.PluginData.Load(Turbine.DataScope.Server, groupMembersFileName);
end



function loadSettings()
	-- Load Settings and customization --
	local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
	local _customization = Turbine.PluginData.Load(Turbine.DataScope.Server, customizationFileName);
	local _savedGroupNames = Turbine.PluginData.Load(Turbine.DataScope.Server, savedGroupNamesFileName);

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
	else
		playerNameColor = defaultPlayerNameColor;
	end
end


-- Turns RGB values to turbine color objects --
function toColor(r, g, b)

	if (tonumber(r) == nil) or (tonumber(g) == nil) or (tonumber(b) == nil) then
		-- Try to fix numbers by chaning "." to "," --
		r = r:gsub("%.", ",");
		g = g:gsub("%.", ",");
		b = b:gsub("%.", ",");
	end

	return Turbine.UI.Color(tonumber(r), tonumber(g), tonumber(b));
end


function saveSettings()
	-- Return if setting elements don't exist (tested with one of the checkboxes) --
	if (UI.enableEscapeCheckbox == nil) then return; end

	-- Get settings --
	if (UI.mainWindow:GetLeft() < 0) then
        settings["windowPosition"]["xPos"] = "0";
    else
        settings["windowPosition"]["xPos"] = tostring(UI.mainWindow:GetLeft());
    end

    if (UI.mainWindow:GetTop() < 0) then
        settings["windowPosition"]["yPos"] = "0";
    else
        settings["windowPosition"]["yPos"] = tostring(UI.mainWindow:GetTop());
    end

	settings["enableEscape"] = UI.enableEscapeCheckbox:IsChecked();
	settings["enableDisband"] = UI.enableDisbandCheckbox:IsChecked();
	settings["enableDismiss"] = UI.enableDismissCheckbox:IsChecked();
	settings["enablePromote"] = UI.enablePromoteCheckbox:IsChecked();
	settings["horizontalWindow"] = UI.horizontalUICheckbox:IsChecked();
	settings["forceTop"] = UI.forceTopCheckbox:IsChecked();
	settings["goldenTheme"] = UI.goldenWindowCheckbox:IsChecked();
	
	-- Save new Settings --
	Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
	Turbine.PluginData.Save(Turbine.DataScope.Server, savedGroupNamesFileName, savedGroupNames);
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
	Turbine.PluginData.Save(Turbine.DataScope.Server, customizationFileName, _customization);
end


-- Turns strings to numbers between min and max value --
function numberToStringMinMax(value, min, max)
	if value == nil then return tostring(min); end
	if value < min then return tostring(min); end
	if value > max then return tostring(max); end
	return tostring(value):gsub(",", ".");
end
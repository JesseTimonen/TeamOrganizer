function sortPartyMembers(array)
	if array == nil then return; end

	local tableSize = getTableSize(array);
	
	for i = 1, tableSize do
		swapped = false;

		for j = 1, tableSize - 1  do
			if (tonumber(array[tostring(j)].class) > tonumber(array[tostring(j + 1)].class)) then
				local temp = array[tostring(j)];
				array[tostring(j)] = array[tostring(j + 1)];
				array[tostring(j + 1)] = temp;
				swapped = true;
			end	
		end

		tableSize = tableSize - 1;
		if not swapped then break end
	end
end


-- Check the size of a table
function getTableSize(table)
	
	if table == nil then return 0; end
    
	local count = 0;
	for a, b in pairs(table) do
		count = count + 1;
    end
    
	return count;
end


-- Check if value is in table --
function inTable(table, value)
	if (table[value] == value) then
		return true;
	end

	return false;
end


-- Remove value from table --
function tableRemoveKey(table, key)
	table[key] = nil;
end


-- Check is player already in your group --
function isPlayerAlreadyInYourGroup(name)
	party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();

	if (party == nil) then
		return false;
	end

	for i = 1, party:GetMemberCount() do
		if (string.lower(name) == string.lower(party:GetMember(i):GetName())) then
			return true;
		end
	end
	
	return false;
end


-- Get class ID from class name (returns 'nil' if no match is found) --
function getClassIDFromName(class)
	class = string.lower(tostring(class));

	classes = {
		["beorning"] = 214, ["beorn"] = 214, ["bear"] = 214, ["214"] = 214, ["beorninger"] = 214, ["beornides"] = 214,
		["burglar"] = 40, ["burg"] = 40, ["40"] = 40, ["schurke"] = 40, ["cambrioleur"] = 40,
		["captain"] = 24, ["cappy"] = 24, ["24"] = 24, ["hauptmann"] = 24, ["capitaine"] = 24,
		["champion"] = 172, ["champ"] = 172, ["172"] = 172, ["waffenmeister"] = 172, ["champion"] = 172,
		["guardian"] = 23, ["guard"] = 23, ["tank"] = 23, ["23"] = 23, ["wächter"] = 23, ["gardien"] = 23,
		["hunter"] = 162, ["hunt"] = 162, ["162"] = 162, ["Jäger"] = 162, ["chasseur"] = 162,
		["lore-master"] = 185, ["loremaster"] = 185, ["lm"] = 185, ["185"] = 185, ["kundiger"] = 185, ["maîtres-du-savoir"] = 185, ["maîtres_du_savoir"] = 185,
		["minstrel"] = 31, ["minny"] = 31, ["mini"] = 31, ["healer"] = 31, ["heal"] = 31, ["31"] = 31, ["barde"] = 31, ["ménestrel"] = 31,
		["rune-keeper"] = 193, ["runekeeper"] = 193, ["rk"] = 193, ["193"] = 193, ["runenbewahrer"] = 193, ["gardien-des-runes"] = 193, ["gardien_des_runes"] = 193,
		["warden"] = 194, ["ward"] = 194, ["194"] = 194, ["hüter"] = 194, ["sentinelle"] = 194,
	};

	return classes[class];
end


-- Get class name from class ID (returns 'unknown' if no match is found) --
function getClassNameFromID(id)
	id = tostring(id);

	IDs = {
		["214"] = "beorning",
		["40"] = "burglar",
		["24"] = "captain",
		["172"] = "champion",
		["23"] = "guardian",
		["162"] = "hunter",
		["185"] = "lore-master",
		["31"] = "minstrel",
		["193"] = "rune-keeper",
		["194"] = "warden",
	};

	if (IDs[id] == nil) then
		return "unknown";
	end

	return IDs[id];
end
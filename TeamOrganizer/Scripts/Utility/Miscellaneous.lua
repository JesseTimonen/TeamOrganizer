function sortPartyMembers(array)
	-- Return if array is empty --
	if array == nil then return end

	local length = getLenght(array);
	
	for i = 1, length do
		swapped = false;

		for j = 1, length - 1  do
			if (tonumber(array[tostring(j)].class) > tonumber(array[tostring(j + 1)].class)) then
				local temp = array[tostring(j)];
				array[tostring(j)] = array[tostring(j + 1)];
				array[tostring(j + 1)] = temp;
				swapped = true;
			end	
		end

		length = length - 1;
		if not swapped then break end
	end
end


-- Check the size of an array
function getLenght(array)
	-- Check is array empty --
	if array == nil then
		return 0;
    end
    
    -- Get size --
	local count = 0;
	for a, b in pairs(array) do
		count = count + 1;
    end
    
	return count;
end


function inArray(array, value)
	if (array[value] == value) then
		return true;
	end

	return false;
end


function inTable(array, value)
	for index, val in ipairs(array) do
		if (val == value) then
			return true;
		end
	end

    return false;
end


function table_removeKey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end


function playerIsInGroup(name)
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


-- Return ID of a class --
function getClassID(class)
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
		["warden"] = 194, ["ward"] = 194, ["194"] = 194, ["hüter"] = 194, ["sentinelle"] = 194
	};

	return classes[class];
end
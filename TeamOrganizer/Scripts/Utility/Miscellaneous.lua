-- Sort party members by their class using bubble sort algorithm --
function sortPartyMembers(array)
	-- Return empty if array is empty --
	if array == nil then
		return nil;
	end

	local length = getLenght(array);

	for i = 1, length do

		local inOrder = true;

		for j = 1, length - 1 do
			if tonumber(array[tostring(j)].class) > tonumber(array[tostring(j + 1)].class) then
				local temp = array[tostring(j)];
				array[tostring(j)] = array[tostring(j + 1)];
				array[tostring(j + 1)] = temp;
				inOrder = false;
			end
		end

		if inOrder then break end
	end
end

-- Check the size of an array
function getLenght(array)
	-- Check is array empty --
	if array == nil then
		return 0;
	end

	local count = 0;
	for a, b in pairs(array) do
		count = count + 1;
	end
	return count;
end


-- Return ID of a class --
function getClassID(class)
	class = string.lower(tostring(class));

	classes = {
		["beorning"] = 214, ["beorn"] = 214, ["bear"] = 214, ["214"] = 214,
		["burglar"] = 40, ["burg"] = 40, ["40"] = 40,
		["captain"] = 24, ["capt"] = 24, ["cappy"] = 24, ["24"] = 24,
		["champion"] = 172, ["champ"] = 172, ["chimp"] = 172, ["172"] = 172,
		["guardian"] = 23, ["guard"] = 23, ["tank"] = 23, ["23"] = 23,
		["hunter"] = 162, ["hunt"] = 162, ["162"] = 162,
		["lore-master"] = 185, ["loremaster"] = 185, ["lm"] = 185, ["185"] = 185,
		["minstrel"] = 31, ["mini"] = 31, ["healer"] = 31, ["heal"] = 31, ["31"] = 31,
		["rune-keeper"] = 193, ["runekeeper"] = 193, ["rk"] = 193, ["193"] = 193,
		["warden"] = 194, ["ward"] = 194, ["194"] = 194
	};

	return classes[class];
end
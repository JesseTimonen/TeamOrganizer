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
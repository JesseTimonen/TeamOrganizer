-- Track Chat Messages --
Turbine.Chat.Received = function (sender, args) 
	analyzeMessage(sender, args);
end

-- Track the player's name who was last invited to the party --
-- Because "Target is already in a fellowship" doesn't tell us who the target is --
invitedPlayerName = "";

-- Analyze info about party actions in the chat --
function analyzeMessage(sender, args)
	-- Return if chat type is not correct --
	if (args.ChatType ~= Turbine.ChatType.Standard and args.ChatType ~= Turbine.ChatType.Error) then return end
	if args.Message == nil then return end
	if args.Message == "" then return end

	-- Variables --
	local message = args.Message;
	local name = "";

	-- Check if the player has pending invitation --
	name = string.match(message, translate("invited", clientLanguage));
	if name ~= nil then
		-- Return if player is not the leader of the party --
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();

		-- Make sure player had a party and he is the leader of the party --
		if (party ~= nil and party:GetLeader():GetName() ~= playerName) then return end

		invitedPlayerName = name;
		updateNameLabels(name, "invited");
		return;
	end


	-- Check if player joined the party --
	name = string.match(message, translate("hasJoined", clientLanguage));
	if name ~= nil then updateNameLabels(name, "joined"); return end


	-- Check if player declined invitation --
	name = string.match(message, translate("declined", clientLanguage));
	if name ~= nil then updateNameLabels(name, "declined"); return end


	-- Check if player is already in party --
	if (string.find(message, translate("alreadyInParty", clientLanguage)) and invitedPlayerName ~= "") then
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();

		-- If player doesn't have a party then invited player must be in another party --
		if party == nil then
			updateNameLabels(invitedPlayerName, "alreadyInAnotherParty");
			return;
		end

		-- Check if invited player is in players party --
		for i = 1, party:GetMemberCount() do
			if (party:GetMember(i):GetName() == invitedPlayerName) then
				updateNameLabels(invitedPlayerName, "alreadyInMyParty");
				return;
			end
		end

		updateNameLabels(invitedPlayerName, "alreadyInAnotherParty");
		return;
	end

	
	-- Check is character online --
	name = string.match(message, translate("unknownCharacter", clientLanguage));
	if name ~= nil then updateNameLabels(name, "unknownCharacter"); return end


	-- Check if character leaves the party --
	name = string.match(message, translate("hasLeft", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- Check if character is dismissed from the raid --
	name = string.match(message, translate("personDismissed", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- check if player leaves the party --
	if string.find(message, translate("dropped", clientLanguage)) then updateNameLabels(name, "disband"); return end


	-- Check if fellowship is dismissed --
	if string.find(message, translate("fellowshipDisbanded", clientLanguage)) then updateNameLabels(name, "disband"); return end
	-- Check if raid is dismissed --
	if string.find(message, translate("raidDisbanded", clientLanguage)) then updateNameLabels(name, "disband"); return end
end



-- Update players names when certain actions happen --
function updateNameLabels(name, action)

	-- Turn name to light blue if player has been invited to the group --
	if (action == "invited") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["invited"]);
				break;
			end
		end
		return;
	end


	-- Turn name to green if player joins the party --
	if (action == "joined") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["inParty"]);
				break;
			end
		end
		return;
	end


	-- Turn name to red if player declines to join the party --
	if (action == "declined") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["declined"]);
				break;
			end
		end
		return;
	end


	-- Turn name to green if player is already in your party --
	if (action == "alreadyInMyParty") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["inParty"]);
				invitedPlayerName = "";
				break;
			end
		end
		return;
	end


	-- Turn name to orange if player is already in another party --
	if (action == "alreadyInAnotherParty") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["anotherGroup"]);
				invitedPlayerName = "";
				break;
			end
		end
		return;
	end


	-- Turn name to purple if player doesn't exist --
	if (action == "unknownCharacter") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["offline"]);
				break;
			end
		end
		return;
	end


	-- Turn name to gray if player leaves the group --
	if (action == "left/dismiss") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["notInParty"]);
				break;
			end
		end
		return;
	end


	-- Turn all names to gray if player leaves the group or group gets disband --
	if (action == "disband") then
		for i = 1, table.getn(names) do
			names[i]:SetForeColor(playerNameColor["notInParty"]);
		end
		return;
	end
end
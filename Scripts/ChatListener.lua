-- Track Chat Messages --
Turbine.Chat.Received = function (sender, args)
	if (args.ChatType == Turbine.ChatType.Standard or args.ChatType == Turbine.ChatType.Error) then
		analyzeMessage(args);
	end
end

-- Track the player's name who was last invited to the party --
-- Because "Target is already in a fellowship" doesn't tell us who the target is --
invitedPlayerName = "";

-- Analyze info about party actions in the chat --
function analyzeMessage(args)
	if (args.Message == nil or args.Message == "") then return end

	-- Variables --
	local message = args.Message;
	local name = "";

	-- Check if the player has pending invitation --
	name = string.match(message, translate("invited", clientLanguage));
	if name ~= nil then
		-- Make sure the player is the leader of the party --
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();
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

		-- Check if invited player is already in the group --
		if (Utility.playerIsInGroup(invitedPlayerName)) then
			updateNameLabels(invitedPlayerName, "alreadyInMyParty");
			return;
		end

		updateNameLabels(invitedPlayerName, "alreadyInAnotherParty");
		return;
	end

	
	-- Check is the character online --
	name = string.match(message, translate("unknownCharacter", clientLanguage));
	if name ~= nil then updateNameLabels(name, "unknownCharacter"); return end


	-- Check if the character leaves the party --
	name = string.match(message, translate("hasLeft", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- Check if the character is dismissed from the raid --
	name = string.match(message, translate("personDismissed", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- check if player leaves the party --
	if string.find(message, translate("dropped", clientLanguage)) then updateNameLabels("", "disband"); return end


	-- Update UI when player joins a group --
	if string.find(message, translate("joinedFellowship", clientLanguage)) then
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		reloadPlugin();
		return
	end
	if string.find(message, translate("joinedRaid", clientLanguage)) then
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		reloadPlugin();
		return
	end


	-- Check if player was dismissed --
	if string.find(message, translate("dismissedFromFellowship", clientLanguage)) then updateNameLabels("", "disband"); return end
	if string.find(message, translate("dismissedFromRaid", clientLanguage)) then updateNameLabels("", "disband"); return end


	-- Check if fellowship/raid was dismissed --
	if string.find(message, translate("fellowshipDisbanded", clientLanguage)) then updateNameLabels("", "disband"); return end
	if string.find(message, translate("raidDisbanded", clientLanguage)) then updateNameLabels("", "disband"); return end
end



-- Update players' names when certain actions happen --
function updateNameLabels(name, action)

	-- Update player's color if the player received party invitation --
	if (action == "invited") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["invited"]);
				return;
			end
		end
	end


	-- Update player's color if the player joins the group --
	if (action == "joined") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["inParty"]);
				return;
			end
		end
	end


	-- Update player's color if the player declines to join the group --
	if (action == "declined") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["declined"]);
				return;
			end
		end
	end


	-- Update player's color if the player is already in a party --
	if (action == "alreadyInMyParty") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["inParty"]);
				invitedPlayerName = "";
				return;
			end
		end
	end


	-- Update player's color if the player is already in another group --
	if (action == "alreadyInAnotherParty") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["anotherGroup"]);
				invitedPlayerName = "";
				return;
			end
		end
	end


	-- Update player's color if the player doesn't exist --
	if (action == "unknownCharacter") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["offline"]);
				return;
			end
		end
	end


	-- Update player's color if the player leaves the group --
	if (action == "left/dismiss") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["notInParty"]);
				return;
			end
		end
	end


	-- Update every players' color if the group gets disbanded or user leaves the group --
	if (action == "disband") then
		for i = 1, table.getn(names) do
			names[i]:SetForeColor(playerNameColor["notInParty"]);
		end
		return;
	end
end
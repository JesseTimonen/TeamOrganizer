-- Track Chat Messages --
Turbine.Chat.Received = function (sender, args)
	if (args.ChatType == Turbine.ChatType.Standard or args.ChatType == Turbine.ChatType.Error) then
		analyzeMessage(args);
	end
end

-- Track the player's name who was last invited to the party --
-- Because "Target is already in a fellowship" doesn't tell us who the target is --
lastInvitedPlayerName = "";

-- Analyze info about party actions in the chat --
function analyzeMessage(args)
	if (args.Message == nil or args.Message == "") then return; end

	-- Variables --
	local message = args.Message;
	local name = "";

	
	-- Check if the player has pending invitation --
	name = string.match(message, translate("TEXT_CHAT_INVITED", clientLanguage));
	if name ~= nil then
		-- Make sure the player is the leader of the party --
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();
		if (party ~= nil and party:GetLeader():GetName() ~= playerName) then return; end

		lastInvitedPlayerName = name;
		updateNameLabels(name, "invited");
		return;
	end


	-- Check if player joined the party --
	name = string.match(message, translate("TEXT_CHAT_HAS_JOINED", clientLanguage));
	if name ~= nil then updateNameLabels(name, "joined"); return end


	-- Check if player declined invitation --
	name = string.match(message, translate("TEXT_CHAT_DECLINED", clientLanguage));
	if name ~= nil then updateNameLabels(name, "declined"); return end


	-- Check if player is already in party --
	if (string.find(message, translate("TEXT_CHAT_ALREADY_IN_PARTY", clientLanguage)) and lastInvitedPlayerName ~= "") then
		party = Turbine.Gameplay.LocalPlayer.GetInstance().GetParty();

		-- If player doesn't have a party then invited player must be in another party --
		if party == nil then
			updateNameLabels(lastInvitedPlayerName, "alreadyInAnotherParty");
			return;
		end

		-- Check if invited player is already in the group --
		if (Utility.isPlayerAlreadyInYourGroup(lastInvitedPlayerName)) then
			updateNameLabels(lastInvitedPlayerName, "alreadyInMyParty");
			return;
		end

		updateNameLabels(lastInvitedPlayerName, "alreadyInAnotherParty");
		return;
	end

	
	-- Check is the character online --
	name = string.match(message, translate("TEXT_CHAT_UNKNOWN_CHARACTER", clientLanguage));
	if name ~= nil then updateNameLabels(name, "unknownCharacter"); return end


	-- Check if the character leaves the party --
	name = string.match(message, translate("TEXT_CHAT_HAS_LEFT", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end

	
	-- Check if party members are dismissed from the party --
	name = string.match(message, translate("TEXT_CHAT_HAS_BEEN_DISMISSED", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- Check if the character is dismissed from the raid --
	name = string.match(message, translate("TEXT_CHAT_PERSON_DISMISSED", clientLanguage));
	if name ~= nil then updateNameLabels(name, "left/dismiss"); return end


	-- check if player leaves the party --
	if string.find(message, translate("TEXT_CHAT_DROPPED", clientLanguage)) then updateNameLabels("", "disband"); return end


	-- Update UI when player joins a group --
	if string.find(message, translate("TEXT_CHAT_JOINED_FELLOWSHIP", clientLanguage)) then
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		reloadPlugin();
		return
	end
	if string.find(message, translate("TEXT_CHAT_JOINED_RAID", clientLanguage)) then
		Scripts.settings["loadRequest"] = "previous group";
		Scripts.saveSettings();
		reloadPlugin();
		return
	end


	-- Check if player was dismissed --
	if string.find(message, translate("TEXT_CHAT_DISMISSED_FROM_FELLOWSHIP", clientLanguage)) then updateNameLabels("", "disband"); return end
	if string.find(message, translate("TEXT_CHAT_DISMISSED_FROM_RAID", clientLanguage)) then updateNameLabels("", "disband"); return end


	-- Check if fellowship/raid was dismissed --
	if string.find(message, translate("TEXT_CHAT_FELLOWSHIP_DISBANDED", clientLanguage)) then updateNameLabels("", "disband"); return end
	if string.find(message, translate("TEXT_CHAT_RAID_DISBANDED", clientLanguage)) then updateNameLabels("", "disband"); return end
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
				lastInvitedPlayerName = "";
				return;
			end
		end
	end


	-- Update player's color if the player is already in another group --
	if (action == "alreadyInAnotherParty") then
		for i = 1, table.getn(names) do
			if (names[i]:GetText() == name) then
				names[i]:SetForeColor(playerNameColor["anotherGroup"]);
				lastInvitedPlayerName = "";
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
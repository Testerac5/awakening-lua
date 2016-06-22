local function stayDead(event, player)
	if(player:GetQuestStatus(68934) == 6) then
		player:AddAura(8326, player)
		player:SetHealth(0)
		player:KillPlayer()
	end
end

local function stayDeadLogin(event, player, msg, Type, lang)
	if(player:GetQuestStatus(68934) == 6 and player:HasAura(8326) == true) then
		player:SetHealth(0)
		player:KillPlayer()
		player:CastSpell(player, 50768)
	end
end

local function NoInvitingIronMen(event, group, guid)
	local function removeMeFromGroup(event, delay, pCall, player)
		player:RemoveFromGroup()
	end
	
	local newPlayer = GetPlayerByGUID(guid)
	if (newPlayer:GetQuestStatus(68934) == 6) then
		newPlayer:RegisterEvent(removeMeFromGroup, 50, 1, player)
		t_GroupMembers = group:GetMembers()
		for i, groupMember in ipairs(t_GroupMembers) do
			groupMember:SendBroadcastMessage("|cffff0000Ironmen can't join groups!|r")
		end
	end
end

local function FailIronmanQuest(event, delay, pCall, player)
	player:SendBroadcastMessage("|cffff0000You have lost the ability to become an Ironman!|r")
	player:SetQuestStatus(68934, 5)
	player:FailQuest(68934)
end

local function IronmanCannotCarryQuestForward(event, player, oldLevel)
	if (player:HasQuest(68934) and player:GetQuestStatus(68934) == 1) then
		player:RegisterEvent(FailIronmanQuest, 1000, 1, player)		
	end
end

RegisterPlayerEvent(36, stayDead)
RegisterPlayerEvent(3, stayDeadLogin)
RegisterGroupEvent(1, NoInvitingIronMen)
RegisterPlayerEvent(13, IronmanCannotCarryQuestForward)
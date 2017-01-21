local function DeadBeatWife(event, player, creature)
	if player:HasQuest(4921) then
	player:CompleteQuest(4921)
	end
end

RegisterCreatureGossipEvent(9999997, 1, DeadBeatWife)
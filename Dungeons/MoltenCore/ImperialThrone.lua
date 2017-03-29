RegisterGameObjectEvent( 170592, 10, function(event, go, state) 
	local player = go:GetNearestPlayer(10)
	if not(player) then
		return false
	end
	local creature = player:GetNearestCreature(533, 9019)
	if not(creature) then
		return false
	end
	player:CastSpell( creature, 56685, true)
	end)
--TEMP USED THIS ONE FOR FIXING SEABISCUIT LEARN SPELL--
RegisterPlayerEvent(28, function(event,player)
	if (player:HasSpell(966004)) then
		player:LearnSpell(966002)
		player:RemoveSpell(966004)
	end
	end)
local function OrcFix(event, player)
	player:RemoveSpell(20576)
	player:RemoveSpell(21563)
	player:RemoveSpell(54562)
	player:RemoveSpell(33702)
end


RegisterPlayerEvent(3, OrcFix)
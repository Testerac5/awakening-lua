local function SanctuaryFix(event, player, target)
	if (target:IsPvPFlagged() == false) then
	 print("test 1")
		player:AttackStop()
	print("Test 2")
	end
end
RegisterPlayerEvent(33, SanctuaryFix)
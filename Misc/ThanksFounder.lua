local function fam(event, player, item, count)
	player:SendNotification("|cffFF6600 Thanks for becoming a founder! |r")
	player:CastSpell(player, 55420, false)
end
	
RegisterItemEvent(977020, 2, fam)
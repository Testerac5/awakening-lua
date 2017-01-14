local function MaraStaff(event, player, item, target)
	item:GetGameObjectsInRange( 1, 178386)
	player:CastSpell(player, 21127, false)
end

RegisterItemEvent(17191, 2, MaraStaff)
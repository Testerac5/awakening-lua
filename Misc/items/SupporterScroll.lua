``local function Scroll(event, player, item, target)
	player:SetKnownTitle(258)
	player:SendNotification("|cffFF6600 Thanks for the Support! |r")
	player:CastSpell(player, 55420, false)
end

RegisterItemEvent(977120, 2, Scroll)
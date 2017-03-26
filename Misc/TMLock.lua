local function TMLock1(event, player)
	if (player:GetGMRank() ~= 2) then
		return false
	else
		player:AddAura(39331, player)
	end
end

local function TMLock2(event, player, newZone, newArea)
	if (player:GetGMRank() ~= 2) then
		return false
	elseif (player:GetZoneId() == 876) then
		return false
	else
		player:Teleport(1, 16225.9, 16255, 13.0438, 4.35969)
	end
end

RegisterPlayerEvent(27, TMLock2)
RegisterPlayerEvent(3, TMLock1)
local function teleportDead(event, player)
	if(player:GetQuestStatus(68934) == 6) then
		player:AddAura(8326, player)
		player:SetHealth(0)
		player:KillPlayer()
	end

	if(player:GetAreaId() == 1477) then
		player:Teleport(0, -10618.685547, -3830.111816, 21.594713, 0.471450)
		player:RessurectPlayer(50)
	end
end


local function newZoneBuff(event, player, newZone, newArea)

if (newArea == 35400 and player:HasQuest(125254) == true) then
	player:AddAura(200006, player)
else
	player:RemoveAura(200006)
end


end


RegisterPlayerEvent(27, newZoneBuff)
RegisterPlayerEvent(36, teleportDead)
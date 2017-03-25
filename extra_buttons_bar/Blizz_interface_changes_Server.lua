--fix for talent points players have and which can be used in standart interface and then exploited
local function RemoveTalentPoints(event,player)
    if (player:GetFreeTalentPoints()) then
        player:SetFreeTalentPoints(0)
    end
end

RegisterPlayerEvent(3, RemoveTalentPoints)

--ressurect and tele to city
local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("DeathRessurect", {})

 function MyHandlers.Ressurect(player)
 	if player:HasAura(8326) then
 		player:ResurrectPlayer(20, true)
 		player:DurabilityLossAll(70, true)
 		if player:IsAlliance() then
 			player:Teleport(0, -8525, 851, 106.6, 3.8)
 		else
 			player:Teleport(1, 1451, -4181, 61.6, 1.05)
 		end
 	end
end
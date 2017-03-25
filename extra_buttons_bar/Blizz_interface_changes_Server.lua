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
 		player:RemoveAura(8326)
 	end
end
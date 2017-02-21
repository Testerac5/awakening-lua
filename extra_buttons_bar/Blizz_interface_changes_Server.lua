--fix for talent points players have and which can be used in standart interface and then exploited
local function RemoveTalentPoints(event,player)
    if (player:GetFreeTalentPoints()) then
        player:SetFreeTalentPoints(0)
    end
end

RegisterPlayerEvent(3, RemoveTalentPoints)
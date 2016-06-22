local itemid = 125253

local function RestrictItemUse(event, player, item, target)

if (player:GetAreaId() ~= 354) then
player:SendAreaTriggerMessage("|cffff0000You can't use that item here.|r")
return false
end

end

RegisterItemEvent(itemid, 2, RestrictItemUse)
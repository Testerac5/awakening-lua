local function ZFGong(event, player, item, target)
	local goober = player:GetNearestGameObject( 3, 141832)
	local dupe = player:GetCreaturesInRange(100, 7273, 0, 0)
	if (goober == nil) then
		player:SendBroadcastMessage("no goober")
		return false;
	elseif (dupe ~= 0) then
		player:SendBroadcastMessage("there are " ..tostring(dupe).. " ghazrillas.")
		return false;
	else
		player:SpawnCreature(7273, 1665.56, 1187.32, 6.64, 3.9, 7)
		player:SendBroadcastMessage("gong used")
	end
end

RegisterItemEvent(9240, 2, ZFGong)
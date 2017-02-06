local function ZFGong(event, player, item, target)
	local goober = player:GetNearestGameObject( 3, 141832)
	if (goober == nil) then
		return false;
	elseif (player:GetCreaturesInRange(100, 7273, 0, 0) ~= nil) then
		return false;
	else
		player:SpawnCreature(7273, 1665.56, 1187.32, 6.64, 3.9, 7)
	end
end

RegisterItemEvent(17191, 2, ZFGong)
local function FuckingImps(event, creature, attacker, damage)
	local owner = creature:GetOwner()
	if (owner:HasAura(19028) == false) then
		return false
	elseif (creature:HasAura(4511) == false) then
		return false
	else
		player:RemoveAura(19028)
		creature:RemoveAura(19028)
	end
end


RegisterCreatureEvent(416, 9, FuckingImps)
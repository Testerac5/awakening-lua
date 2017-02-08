local function FuckingImps(event, creature, target)
	local owner = creature:GetOwner()
	if (owner:HasAura(19028) == false) 
		return false
	elseif (creature:HasAura(20329) == false)
		return false
	else
		player:RemoveAura(19028)
		creature:RemoveAura(19028)
	end
end


RegisterCreatureEvent(416, 12, FuckingImps)
local function PoisonMaxSkill(event, player)
	local x = player:GetSkillValue(40)
	if player:HasSpell(2842) then
		player:SetSkill(40, 0, x, 300)
	end
end

RegisterPlayerEvent( 3, PoisonMaxSkill)
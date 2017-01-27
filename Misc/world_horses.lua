local horse_id = {5403, 5406, 5405, 5404, 12376, 14559, 15460, 14561, 28899, 4269, 27214}

local function HourseCustomSpell(event, creature, unit)
	if not(creature.num) then
		creature.num = 0
	end
	creature.num = creature.num+1
if (creature.num == 140) then
	local customspellornot = math.random(1, 2)
		if (customspellornot == 1) then
				creature:RemoveAura(55587)
		elseif (customspellornot == 2) then
				creature:AddAura(55587, creature)
		end
creature.num = 0
end
end
for k, v in pairs(horse_id) do
RegisterCreatureEvent(v, 7, HourseCustomSpell)
end
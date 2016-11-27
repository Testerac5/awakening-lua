local horse_id = {5403, 5406, 5405, 5404, 12376, 14559, 15460, 14561, 28899, 4269, 27214}
local num = 0
local function HourseCustomSpell(event, creature, unit)
	num = num+1
if (num == 70) then
	local customspellornot = math.random(1, 2)
		if (customspellornot == 1) then
				creature:RemoveAura(55587)
		elseif (customspellornot == 2) then
				creature:AddAura(55587, creature)
		end
num = 0
end
end
for k, v in pairs(horse_id) do
RegisterCreatureEvent(v, 27, HourseCustomSpell)
end
local function ObjectTimer
end

local function HitObject(event, creature, target, spellid)
	target:SendBroadcastMessage("hit")
end

RegisterCreatureEvent(11982, 15, HitObject)
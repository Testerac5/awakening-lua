local function Redo(eventId, delay, repeats, player)
	Buff(event, player)
	--DEBUG--player:SendBroadcastMessage("test")
end

local timing = false

function Buff(event, player)
	-- query to select spell and map
	local Buff1 = WorldDBQuery("SELECT map, spell FROM instance_buff WHERE map = " ..player:GetMapId().. ";")
	if (Buff1 ~= nil) then
		--so we dont dupe the same timer 100000 times
		if (timing == false) then
			player:RegisterEvent(Redo, 120000, 0)
			--DEBUG--player:SendBroadcastMessage("timing now")
			timing = true
		end
	local mobs = player:GetCreaturesInRange(533)
	local buffspell = Buff1:GetInt32(1)
		-- add aura based on DB query above and loop for mobs in range
		for x=1,#mobs,1 do
			if mobs[x]:HasAura(buffspell) == false then
				mobs[x]:AddAura(buffspell, mobs[x])
			end
		end
	else
		-- do this because they arent in a buffed instance
		timing = false
		--DEBUG--player:SendBroadcastMessage("stopped timing")
	end
end

RegisterPlayerEvent(28, Buff)
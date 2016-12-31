local function Redo(eventId, delay, repeats, player)
	Buff(event, player)
	--DEBUG--player:SendBroadcastMessage("test")
end

local timing = false

function Buff(event, player)
	-- check for player map id
	if (player:GetMapId() == 48) then
		-- make sure we dont dupe the same timer 10000 times
		if (timing == false) then
			player:RegisterEvent(Redo, 5000, 0)
			--DEBUG--player:SendBroadcastMessage("timing now")
			timing = true
		end
	local mobs = player:GetCreaturesInRange(533)
		for x=1,#mobs,1 do
			-- loop to check all mobs in range of 533, add aura ID
			if mobs[x]:HasAura(465) == false then
				mobs[x]:AddAura(465, mobs[x])
			end
		end
	else
		timing = false
		--DEBUG--player:SendBroadcastMessage("stopped timing")
	end
end

RegisterPlayerEvent(28, Buff)
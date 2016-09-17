local function PvPExp(event, pKiller, pKilled)
	--EXP Formula
	local exp1 = pKiller:GetLevel()
	local exp2 = pKilled:GetLevel()
	local mod = exp1 - exp2
	local ExpBase = (exp2 * 5 + 45) * (1 + 0.05 * mod) * PvPExpRate
	--Kill Table stuff
	local killerguid = pKiller:GetGUIDLow()
	local victimguid = pKilled:GetGUIDLow()
	local check = CharDBQuery("SELECT victimguid FROM character_kill_count WHERE killerguid = "..killerguid)
	if(killerguid ~= victimguid) then
		if(check == nil) then -- if player has not killed anyone yet:
			print("Player has no kill data")
			CharDBExecute("INSERT INTO character_kill_count(killerguid, victimguid, count) VALUES("..killerguid..","..victimguid..",1)")
		else
			local kills = CharDBQuery("SELECT count FROM character_kill_count WHERE killerguid = "..killerguid.." AND victimguid = "..victimguid):GetInt32(0)
			local AddKill = kills + 1
			if(pKiller:GetMap() == 0 or pKiller:GetMap() == 1) then
				if (kills < 5) then
					if (exp2 >= exp1 - 10 and exp2 <= exp1 + 10) then
						pKiller:GiveXP(ExpBase)
						CharDBQuery("UPDATE character_kill_count SET count = "..AddKill.." WHERE killerguid = "..killerguid.." AND victimguid = "..victimguid)
					end
				elseif (kills >= 5) then
					if(pKiller:GetLuaCooldown() == 0) then -- Check if cooldown is present
						pKiller:SetLuaCooldown(86400) -- Set cooldown in seconds for kills. Default: 24hrs = 86400
						pKiller:SendBroadcastMessage("You have killed this player to many times and will no longer receive exp from this player for 24 hours.")
					else
						local timer = pKiller:GetLuaCooldown() / 3600
						pKiller:SendBroadcastMessage("There is still "..timer.." hours left on your cooldown.")
					end
				end
			end
		end
	end
end

RegisterPlayerEvent(6, PvPExp)
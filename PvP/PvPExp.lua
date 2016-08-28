

function DailyTimer(event, delay, pCall, player)
	CharDBQuery("DELETE FROM character_kill_count WHERE killerguid = "..killerguid.." AND victimguid = "..victimguid)
	print("Timer started")
end

function PvPExp(event, pKiller, pKilled)
--EXP Formula
	local exp1 = pKiller:GetLevel()
	local exp2 = pKilled:GetLevel()
	local mod = exp1 - exp2
	local ExpBase = (exp2 * 5 + 45) * (1 + 0.05 * mod) * PvPExpRate
--Database stuff for timed total kill count	
	killerguid = pKiller:GetGUIDLow()
	victimguid = pKilled:GetGUIDLow() 
	--local killcounter = CharDBQuery("update character_kill_count set count = (count + 1) where killerguid = "..killerguid.." and victimguid = "..victimguid) -- Add +1 to kill count
	local check_query = CharDBQuery("SELECT victimguid FROM character_kill_count WHERE killerguid = "..killerguid)
	local check = check_query:GetInt32(0)
	if(check == nil) then
		print("Test 1")
		CharDBExecute("INSERT INTO character_kill_count(killerguid, victimguid, count) VALUES("..killerguid..","..victimguid..",1)")
		--pKiller:RegisterEvent(DailyTimer, 86400000, 0)
	elseif (check ~= nil) then
		local kills = CharDBQuery("SELECT count FROM character_kill_count WHERE killerguid = "..killerguid.." AND victimguid = "..victimguid)
		local num = kills:GetInt32(0)
		if (num >= num + 5) then
		print("Test 2")
			pKiller:SendBroadcastMessage("You have killed this player too many times and will no longer receive exp from this player for another 24 hours.")
		else
			if(pKiller:GetMap() == 0 or pKiller:GetMap() == 1) then
				if (exp2 >= exp1 - 10 and exp2 <= exp1 + 10) then
					print("Test 3")
					pKiller:GiveXP(ExpBase)
					
					local count = num + 1
					CharDBQuery("UPDATE character_kill_count SET count = "..count.." WHERE killerguid = "..killerguid.." AND victimguid = "..victimguid)
					print("Test 4")
				end
			end	
		end	
	end
end
RegisterPlayerEvent(6, PvPExp)
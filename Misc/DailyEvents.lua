local function DailyGloryFlush(event, player)
	local Stime2 = tostring(GetGameTime())
	-- readies for next timer
	CharDBQuery("DELETE FROM timestamps WHERE state = 1")
	CharDBQuery("INSERT INTO timestamps VALUES ( 1, " ..Stime2.. ");")
	player:UnbindInstance(409)
end

local function ResetCheck(event, player)
	-- the time, in seconds
	-- use integers that divide evenly into the "save players interval" value in world.conf for best results
	local timerdaily = 90
	local GUpdate1 = CharDBQuery("SELECT * FROM timestamps WHERE state = 1")
	local Stime = GetGameTime()
	if (player ~= nil) then
		if (GUpdate1 ~= nil) then
			if (Stime >= GUpdate1:GetInt32(1) + timerdaily) then
				DailyGloryFlush(event, player)
			--	player:SendBroadcastMessage("Daily timer has triggered.")
			--	player:SendBroadcastMessage("Raids are now reset.")
			end
		elseif (player:IsGM() == true) then
			-- sends an error message to GMs and server if there is no flush time in the DB
			player:SendBroadcastMessage("The Glory system has broken! Contact an administrator ASAP!")
			print("[Eluna]: Error loading LUA script: Glory.lua - There is a nil value in the database `timestamps`. Check entries!")
		end
	end
end
--[[
			ToDO:
1. Set up chair fix - In Progress
	a) Try emote states - FAILED
	b) Try Gameobject hook - N/A
	c) Create a beacon - N/A
2. Find a way to prevent players from attacking at all once in sanctuary - Not Started
	a) Find a way to change their target 
		i) Clear target - N/A
		ii) Select Self - N/A

]]
--[[
local function sanctuary_fix_2(eventId, delay, repeats, player) -- using to prevent saving flags after leaving the inn
if not(player:IsRested()) and not(player:IsFFAPVP()) then
	player:SetFFA(true)
end

if player:IsInCombat() and player:GetVictim() then
	if not player:GetVictim():ToPlayer() then
		return false
	end
	local victim = player:GetVictim():ToPlayer()
	if ((player:IsAlliance() and victim:IsAlliance()) or (player:IsHorde() and victim:IsHorde())) then
		if not(victim:IsFFAPVP()) then
			player:ClearInCombat()
		end
	end
	end
end

local function TimingChecks(event,player)
	player:RegisterEvent(sanctuary_fix_2, 2000, 0)
end

RegisterPlayerEvent(3, TimingChecks)]]--
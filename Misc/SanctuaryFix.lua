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

local function sanctuary_fix_2(event, player, newZone, newArea) -- using to prevent saving flags after leaving the inn
if not(player:IsRested()) and not(player:IsFFAPVP()) then
	player:SetFFA(true)
end
end
RegisterPlayerEvent(27, sanctuary_fix) -- zone change

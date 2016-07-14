
local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("HungerBar", {})


player_hunger_table = {}

function hunger_ticker(event, timer, delay, player)

	local level = player:GetLevel()
	local damage_dealt = 25
	
	local deficit = 1
	
	if level > 10 then
	
		damage_dealt = level * 15
	
	elseif level > 30 then
	
		deficit = 3
		damage_dealt = level * 30
		
	elseif level > 50 then
	
		deficit = 5
		damage_dealt = level * 45
		
	end

	player_hunger_table[player:GetGUIDLow()] = player_hunger_table[player:GetGUIDLow()] - (deficit)
	
	if player_hunger_table[player:GetGUIDLow()] <= 0 then
	
		player_hunger_table[player:GetGUIDLow()] = 0
		
		player:DealDamage(player, damage_dealt, false, 7)
		
	end
	
	update_display_hunger(AIO.Msg(), player):Send(player)

end

function update_display_hunger(msg, player)

	local hunger = player_hunger_table[player:GetGUIDLow()]
	
	return msg:Add("HungerBar", "GetHungerPct", hunger)

end

local function OnLoginPlayer(event, player)

	local guid = player:GetGUIDLow()
	
	local char_query = CharDBQuery("select hunger from character_saved_hunger where guid = "..guid)
	
	local player_hunger = 100
	
	if char_query == nil then
	
		CharDBExecute("INSERT INTO character_saved_hunger(guid, hunger) VALUES("..guid..",100)")
		
	else
		print("Successfully loaded from table")
		player_hunger = char_query:GetInt32(0)
		
	end
	
	
	player_hunger_table[guid] = player_hunger
	AIO.Handle(player, "HungerBar", "OnLogin")
	player:RegisterEvent(hunger_ticker, 300000, 0)
	
	update_display_hunger(AIO.Msg(), player):Send(player)

end


local function OnItemUse(event, player, item, target)

	local level = player:GetLevel()
	local itemLevel = item:GetItemLevel()
	local max_hunger = (level * 5) + 100
	local food = 50
	
	if itemLevel >= level or itemLevel +  5 >= level then
	
		food = 50 + (level * 5)
		
	else
	
		food = 50 - (level - itemLevel)
		
		if food < 0 then
		
			food = 0
		
		end
	
	end
	
	player_hunger_table[player:GetGUIDLow()] = player_hunger_table[player:GetGUIDLow()] + (food)
	
	if player_hunger_table[player:GetGUIDLow()] > max_hunger then
	
		player_hunger_table[player:GetGUIDLow()] = max_hunger
	
	end
	
	update_display_hunger(AIO.Msg(), player):Send(player)

end

all_food_drink = {117, 159, 414, 422, 724, 733, 787, 961, 1017, 1082, 
1113, 1114, 1179, 1205, 1326, 1401, 1487, 1645, 1707, 1708, 2070, 
2136, 2287, 2288, 2593, 2594, 2595, 2596, 2679, 2680, 2681, 2682, 
2683, 2684, 2685, 2686, 2687, 2723, 2888, 2894, 3220, 3448, 3662, 
3663, 3664, 3665, 3666, 3703, 3726, 3727, 3728, 3729, 3770, 3771, 
3772, 3927, 4457, 4536, 4537, 4538, 4539, 4540, 4541, 4542, 4544, 
4592, 4593, 4594, 4595, 4599, 4600, 4601, 4602, 4604, 4605, 4606, 
4607, 4608, 4656, 4791, 5057, 5066, 5095, 5342, 5349, 5350, 5472, 
5473, 5474, 5476, 5477, 5478, 5479, 5480, 5525, 5526, 5527, 34411, 
6038, 6290, 6299, 6316, 6522, 6657, 6807, 6887, 6888, 6890, 7097, 
7228, 7676, 7806, 7807, 7808, 8075, 8076, 8077, 8078, 8079, 8364, 
8766, 8932, 8948, 8950, 8952, 8953, 8957, 9260, 9360, 9361, 9451, 
9681, 10841, 11109, 11415, 11444, 11584, 11846, 11951, 12003, 12209, 12210, 
12212, 12213, 12214, 12215, 12216, 12217, 12218, 12224, 12238, 13546, 13724, 
13755, 13810, 13851, 13893, 13927, 13928, 13929, 13930, 13931, 13932, 13933, 
13934, 13935, 16166, 16167, 16168, 16169, 16170, 16171, 16766, 16971, 17119, 
17196, 17197, 17198, 17222, 17344, 17402, 17403, 17404, 17406, 17407, 17408, 
18045, 18254, 18255, 18287, 18288, 18300, 18632, 18633, 18635, 19221, 19222, 
19223, 19224, 19225, 19299, 19300, 19301, 19304, 19305, 19306, 19696, 19994, 
19995, 19996, 20031, 20074, 20452, 20516, 20709, 20857, 21023, 21030, 21031, 
21033, 21072, 21114, 21151, 21215, 21217, 21235, 21254, 21552, 21721, 22018, 
22019, 22324, 22645, 22895, 23160, 23495, 23756, 23848, 24008, 24009, 24072, 
24105, 24338, 24539, 27635, 27636, 27651, 27655, 27656, 27657, 27658, 27659, 
27660, 27661, 27662, 27663, 27664, 27665, 27666, 27667, 27854, 27855, 27856, 
27857, 27858, 27859, 27860, 28112, 28284, 28399, 28486, 28501, 29112, 29292, 
29393, 29394, 29395, 29401, 29412, 29448, 29449, 29450, 29451, 29452, 29453, 
29454, 30155, 30355, 30357, 30358, 30359, 30361, 30457, 30458, 30610, 30703, 
30816, 31672, 31673, 32453, 32455, 32667, 32668, 32685, 32686, 32721, 32722, 
33042, 33048, 33052, 33053, 34062, 33872, 33867, 33866, 33825, 33874, 33924, 
34780, 34832, 35563, 35565, 38428, 38427, 38432, 38466, 38429, 38430, 38431, 
41751, 33443, 33444, 33445, 33449, 33451, 33452, 33454, 34125, 34747, 34748, 
34749, 34750, 34751, 34752, 34753, 34754, 34755, 34756, 34757, 34758, 34759, 
34760, 34761, 34762, 34763, 34764, 34765, 34766, 34767, 34768, 34769, 35720, 
35947, 35948, 35949, 35950, 35951, 35952, 35953, 35954, 37252, 37253, 37452, 
38350, 38698, 38706, 39520, 39691, 40035, 40036, 40042, 40202, 40356, 40357, 
40358, 40359, 41729, 41731, 42428, 42429, 42430, 42431, 42432, 42433, 42434, 
42777, 42778, 42779, 42942, 42993, 42994, 42995, 42996, 42997, 42998, 42999, 
43000, 43001, 43004, 43005, 43015, 43086, 43087, 43236, 43268, 43478, 43480, 
43488, 43490, 43491, 43492, 43518, 43523, 43695, 43696, 44049, 44071, 44072, 
44114, 44228, 44570, 44571, 44573, 44574, 44575, 44607, 44608, 44609, 44616, 
44617, 44618, 44722, 44749, 44750, 44953, 33004, 44791, 44836, 44837, 44838, 
44839, 44840, 44854, 44855, 45932, 44940, 44941, 46691, 46690, 46793, 46797
}

for k,v in ipairs(all_food_drink) do
	RegisterItemEvent(v, 2, OnItemUse)
end





local function OnLogoutPlayer(event ,player)
	local guid = player:GetGUIDLow()
	local hunger = player_hunger_table[guid]
	
	CharDBExecute("UPDATE character_saved_hunger SET hunger = "..hunger.." WHERE guid = "..guid)

end

RegisterPlayerEvent(3, OnLoginPlayer)
RegisterPlayerEvent(4, OnLogoutPlayer)
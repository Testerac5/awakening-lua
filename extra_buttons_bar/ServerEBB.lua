local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("sideBar", {})



function MyHandlers.ReceivePlayerStats(player)
	local player_guid = player:GetGUIDLow()
	local stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
	local stat_point_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
	local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4), stat_point_query:GetInt32(0)}
	sendStatsToPlayer(AIO.Msg(), player, stats):Send(player)
end



function MyHandlers.AddStats(player, stat)
	-- stat values equal >>>>> 1 = strength | 2 = stamina | 3 = agility | 4 = intellect | 5 = spirit 

	local stat_names = {"str", "sta", "agi", "inte", "spi"}
	local player_guid = player:GetGUIDLow()
	
	local stat_point_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
	local points_avail = stat_point_query:GetInt32(0)
	
	if points_avail > 0 then
		local points_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
		local point_val = points_query:GetInt32(0)
		point_val = point_val - 1
		if point_val >= (player:GetLevel() * 5) - 5 then
			point_val = (player:GetLevel() * 5) - 5
		end
		CharDBExecute("UPDATE character_stat_points SET points = "..point_val.." WHERE guid = "..player_guid)
	
		local stat_use = stat_names[stat]

	
		local stats_query = CharDBQuery("SELECT "..stat_use.." FROM character_stat_allocation WHERE guid = "..player_guid)
		local stat_value = stats_query:GetInt32(0)
		
		
		stat_value = stat_value + 1
		
		CharDBExecute("UPDATE character_stat_allocation set "..stat_use.." = "..stat_value.." WHERE guid = "..player_guid)
		
		
		stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
		
		local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4), point_val}
		stats[stat] = stat_value
		

		
		sendStatsToPlayer(AIO.Msg(), player, stats):Send(player)
		player_stat_auras(player, stats)
		
	
	else
	
		player:SendBroadcastMessage("You do not have enough points to do that!")
		
	end
	

end




function MyHandlers.ReduceStats(player, stat)
	-- stat values equal >>>>> 1 = strength | 2 = stamina | 3 = agility | 4 = intellect | 5 = spirit 
	local stat_names = {"str", "sta", "agi", "inte", "spi"}
	local player_guid = player:GetGUIDLow()
	local stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
	local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4)}
	
	if stats[stat] > 0 then
	
		local points_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
		local point_val = points_query:GetInt32(0)
		point_val = point_val + 1
		if point_val >= (player:GetLevel() * 5) - 5 then
			point_val = (player:GetLevel() * 5) - 5
		end
		CharDBExecute("UPDATE character_stat_points SET points = "..point_val.." WHERE guid = "..player_guid)
	
	
		local stat_value = stats[stat] - 1
		CharDBExecute("UPDATE character_stat_allocation set "..stat_names[stat].." = "..stat_value.." WHERE guid = "..player_guid)
		
		stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
		local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4), point_val}
		
		stats[stat] = stat_value
		

		
		sendStatsToPlayer(AIO.Msg(), player, stats):Send(player)
		player_stat_auras(player, stats)
		
		
		
	else
	
		player:SendBroadcastMessage("You do not have any points in that stat")
	
	end

end




function sendStatsToPlayer(msg, player, stats)

	return msg:Add("sideBar", "GetStatValues", stats)

end



local function OnPlayerLogin(event, player)
	
	local player_guid = player:GetGUIDLow()
	local stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
	local points_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
	if stats_query == nil or points_query == nil then
		CharDBExecute("INSERT INTO character_stat_allocation(guid, str, sta, agi, inte, spi) VALUES ("..player_guid..", 0, 0, 0, 0, 0)")
		local init_points = player:GetLevel() * 5
		CharDBExecute("INSERT INTO character_stat_points(guid, points) VALUES("..player_guid..","..init_points..")")
		
	else
	
		local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4)}
		player_stat_auras(player, stats)
		player:DealHeal(player, 818037, 500000)
	end
	

end



function player_stat_auras(player, stats)
	local stat_auras = {7464, 7477, 7471, 7468, 7474}
	for i,v in ipairs(stats) do
		if v == 0 and player:HasAura(stat_auras[i]) == true then
			player:RemoveAura(stat_auras[i], player)
		
		elseif v ~= 0 then
		
			if player:HasAura(stat_auras[i]) == false then
				player:AddAura(stat_auras[i], player)
				print("adding aura")
			end
		
			local stack_amount = stats[i]
			local aura = player:GetAura(stat_auras[i])
			aura:SetStackAmount(stack_amount)
			
		
		end
	end
end

local function OnLevelChange(event, player, oldLevel)

	local player_guid = player:GetGUIDLow()

	local points_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
	local point_val = points_query:GetInt32(0)
	point_val = point_val + 5
	CharDBExecute("UPDATE character_stat_points SET points = "..point_val.." WHERE guid = "..player_guid)
	
	local stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
	local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4), point_val}
	
	sendStatsToPlayer(AIO.Msg(), player, stats):Send(player)

end


RegisterPlayerEvent(13, OnLevelChange)
RegisterPlayerEvent(3, OnPlayerLogin)


function MyHandlers.ResetSpells(player)

	if player:HasItem(spell_reset_token) == true then
		player:RemoveItem(spell_reset_token, 1)
		for i,k in ipairs(spell_ids) do
			if player:HasSpell(k) == true then
				player:RemoveSpell(k)
				player:AddItem(spell_essence, 2)
			end
		end	
		player:SendBroadcastMessage("Refund Complete for Spells")
	else
		player:SendBroadcastMessage("You are missing the required token to do this!")
	end
end




function MyHandlers.ResetTalents(player)

	if player:HasItem(talent_reset_token) == true then
		player:RemoveItem(talent_reset_token, 1)
		for i, talent in ipairs(talent_ids) do
			if player:HasSpell(talent) == true then
				player:RemoveSpell(talent)
				player:AddItem(talent_essence)
			end
		end
		player:SendBroadcastMessage("Refund Complete for talents")
	else
		player:SendBroadcastMessage("You are missing the required token to do this!")
	end

end





CacheMsg = AIO:CreateMsg()

--[[DYNAMIC SPELL SYSTEM FUNCTIONS]]
function SendDamage(player, target, spellID, amount, school)		--Sends damage to the target.
	player:SendDamage(target, amount, spellID, school, false)
end
function SendHeal(player, target, spellID, amount)					--Heals the target.
	player:DealHeal(target, spellID, amount, false)
end
function SendCooldown(player, spellID, duration)					--Sends the cooldown to the player.
	player:SendCooldown(spellID, duration)
end
function SendAura(player, target, spellID, duration)				--Sets the duration of the effect on the target.
	player:AddAura(spellID, target)
	local aura = target:GetAura(spellID)
	if (aura) then
		aura:SetMaxDuration(duration)
		aura:SetDuration(duration)
	end
end

--[[ENERGY DRAIN]]
function EnergyDrain(eventID, delay, pCall, player)
	local CurrentEnergy = player:GetPower(3)
	if (player:GetAura(818012)) then
		if (player:GetPower(3) >= 25) then
			local NewEnergy = (CurrentEnergy-25)
			player:SetPower(3, NewEnergy)
		else
			player:RemoveEvents()
			player:RemoveAura(818012)
		end
	else
		player:RemoveEvents()
	end
end

function ShowTrainFrame(event, player, unit, id, initid, code)
	player:SendTrainerList(unit)
	player:SendBroadcastMessage("test")
end

RegisterCreatureGossipEvent(5480, 1, ShowTrainFrame)

function RemoveExhaustion(eventID, delay, pCall, player)
	local CurrentEnergy = player:GetPower(3)
	if (CurrentEnergy >= 200) and (player:GetAura(818013)) then
		player:RemoveAura(818013)
		player:RemoveEvents()
		player:SendBroadcastMessage("You feel refreshed.")
	end
end

--[[AUTO ATTACK]]
function auto_attack(event, player, spell)
	if (spell:GetEntry()==7712) then
		if (player:GetPower(3)>=75) then
			player:CastSpell(player, 818001, false)
		else
			player:CastSpell(player, 818013, false)
			player:SendBroadcastMessage("|cffff0000You have become exhausted!|r")
			player:RegisterEvent(RemoveExhaustion, 250, 0)
		end
	end
end
RegisterPlayerEvent(5, auto_attack)

--[[INNATE SPRINT FUNCTIONALITY]]
function sprintcheck(event, player, spell)
	if (spell:GetEntry()==818012) then
		if (player:GetAura(818011)) then
			player:RemoveAura(818011)
		end
		if (player:GetAura(818012)) then 
			spell:Cancel()
			player:RemoveAura(818012)
			player:RemoveEvents()
		else
			curen = player:GetPower(3)
			player:RegisterEvent(EnergyDrain, 1000, 0)
			player:SetMaxPower(3, 1000)
			player:SetPower(3, curen)
		end
	end
end
RegisterPlayerEvent(5, sprintcheck)
			

--[[GROUP EXP CALCULATION]]
--bonus_xp_system = {}
--bonus_xp_system.creature_exceptions = {} -- By Id
--function bonus_xp_system.check(group, killed_level, killer)
	--local membercount = 0
	--local combinedlevel = 0
	--for k, v in ipairs(group) do 
		--membercount = membercount+1
		--combinedlevel = combinedlevel+v:GetLevel()
	--end
	--local avglevel = combinedlevel/membercount
	--for k, v in ipairs(group) do
		--sub_level = killed_level - avglevel
		--dist = v:GetDistance(killer)
		--if ((killed_level-v:GetLevel()) < GroupBonusExpLevelDiff) and (dist<=xpdist) then
			--v:SendBroadcastMessage(sub_level)
			--bonus_xp_calc = math.floor((killed_level * GroupBonusExpMultiplier)*(1+(sub_level/10)))
			--bonus_xp_system.give(v, bonus_xp_calc)
		--end
	--end
--end
--function bonus_xp_system.give(player, xp_to_give)
	--player:GiveXP(xp_to_give)
	--player:SendBroadcastMessage("You gain "..xp_to_give.." bonus experience due to kill difficulty and grouping.")
--end
--function bonus_xp_system.initialize(event, killer, killed)
	--if(killer:GetOwner()) then
		--killer = killer:GetOwner()
	--end
	--local stop = false
	--for _k, creature_entry in pairs(bonus_xp_system.creature_exceptions) do
		--if (creature_entry == killed:GetEntry()) then
			--stop = true
		--end
	--end
	--if ((killer:IsInGroup()) and (stop == false)) then
		--local group = killer:GetGroup()
		--local group_table = group:GetMembers()
		--bonus_xp_system.check(group_table, killed:GetLevel(), killer)
	--end
--end
--RegisterPlayerEvent(7, bonus_xp_system.initialize)

--[[ON FIRST LOGIN]]
function first_login (event, player)
	CharDBExecute("INSERT INTO character_stat_points (guid) VALUES ("..player:GetGUIDLow()..")")
	CharDBExecute("INSERT INTO character_stat_allocation (guid, str, agi, sta, inte, spi) VALUES ("..player:GetGUIDLow()..",0, 0, 0, 0, 0)")
	player:LearnSpell(750)
	player:LearnSpell(264)
	player:LearnSpell(5011)
	player:LearnSpell(1180)
	player:LearnSpell(15590)
	player:LearnSpell(266)
	player:LearnSpell(196)
	player:LearnSpell(198)
	player:LearnSpell(201)
	player:LearnSpell(200)
	player:LearnSpell(3018)
	player:LearnSpell(5019)
	player:LearnSpell(227)
	player:LearnSpell(264)
	player:LearnSpell(197)
	player:LearnSpell(199)
	player:LearnSpell(202)
	player:LearnSpell(5009)
	player:AddItem(2504)
	player:AddItem(2512, 400)
	player:AddItem(25)
	player:AddItem(2211)
	player:AddItem(2508)
	player:AddItem(2516, 400)
	player:AddItem(2092)
	player:AddItem(35)
	player:RemoveSpell(78)
	player:RemoveSpell(2457)
	player:LearnSpell(818003)
	player:LearnSpell(818004)
	player:LearnSpell(818014)
	player:SetMaxPower(3, 1000)
	player:LearnSpell(818012)
	player:LearnSpell(818011)
end

RegisterPlayerEvent(30, first_login)

--[[STAT ALLOCATION]]
stat_cache = {}
statpoints_cache = {}
stat_auras = {7464, 7471, 7477, 7468, 7474}
function init_stats (event, player)
	local statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM character_stat_allocation WHERE guid="..player:GetGUIDLow())
	if (statquery==nil) then
		CharDBExecute("INSERT INTO character_stat_allocation VALUES ("..player:GetGUIDLow()..", 0, 0, 0, 0, 0);")
		statquery = CharDBQuery("SELECT str,agi,sta,inte,spi FROM character_stat_allocation WHERE guid="..player:GetGUIDLow())
	end
	local statpointquery = CharDBQuery("SELECT points FROM character_stat_points WHERE guid="..player:GetGUIDLow())
	stat_cache[player:GetGUIDLow()] = {statquery:GetUInt32(0), statquery:GetUInt32(1), statquery:GetUInt32(2), statquery:GetUInt32(3), statquery:GetUInt32(4)}
	statpoints_cache[player:GetGUIDLow()] = statpointquery:GetUInt32(0)
	local ticker = 0
	repeat
	    ticker = ticker+1
	    if (stat_cache[player:GetGUIDLow()][ticker]>0) then
	        player:AddAura(stat_auras[ticker], player)
	        local aura = player:GetAura(stat_auras[ticker])
	        aura:SetStackAmount(stat_cache[player:GetGUIDLow()][ticker])
	    end
	until (ticker==5)
	player:SetSpeed(1, 0.8+(player:GetStat(1)*0.013))
end
RegisterPlayerEvent(3, init_stats)

--[[ON LOGIN]]
function On_LogIn (event, player)
	player:AddAura(7711, player)			--Modded in the DBC files, this is the aura that makes auto attacks cost energy.
	player:SetMaxPower(3, 1000)
	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)			--Language glitch band-aid.
	if (player:GetAura(818012)) then
		player:RegisterEvent(EnergyDrain, 1000, 0)
	end
end

RegisterPlayerEvent(3, On_LogIn)

-- [[Starts events to constantly check agility and spirit and provide proper stats]]
function stat_check_start(event, player)
	player:RegisterEvent(manaregen, 5000, 0)
	player:RegisterEvent(abilitypower, 5000, 0)
end

--[[APPLY MANA REGEN FROM SPIRIT]]
function manaregen (event, delay, repeats, player)
	if player:HasAura(21359) == true then
		player:RemoveAura(21359)
	end
	if (player:GetStat(4)>1) then
		spirit = player:GetStat(4)
		repeat
			player:AddAura(21359, player)
			spirit = (spirit-2)
		until (spirit<=1)
	end
end
-- [[Apply attack power from agility]]
function abilitypower (event, delay, repeats, player)
	if player:HasAura(818015) == true then
		player:RemoveAura(818015)
	end
	if (player:GetStat(1)>1) then
		agility = player:GetStat(1)
		repeat
			player:AddAura(818015, player)
			agility = (agility-2)
		until (agility <= 1)
	end
end

RegisterPlayerEvent(3, stat_check_start)

--[[ON LEVELUP]]
function On_LevelUp (event, player, oldLevel)
	player:AddItem(tokenid, 1)
	player:SetMaxPower(3,1000)
	player:SetPower(3,1000)
	
	if statpoints_cache[player:GetGUIDLow()] == nil then
				init_stats(3, player)
			end
	
	if (oldLevel>player:GetLevel()) then
		if ((statpoints_cache[player:GetGUIDLow()]-((oldLevel-player:GetLevel())*StatPointsPerLevel))<0) then
			statpoints_cache[player:GetGUIDLow()] = 0
			CharDBExecute("UPDATE character_stat_points SET points="..statpoints_cache[player:GetGUIDLow()].." WHERE guid="..player:GetGUIDLow())
			player:SendBroadcastMessage("Stat points set to 0.")
			player:SetMaxPower(3,1000)
		else
			statpoints_cache[player:GetGUIDLow()] = statpoints_cache[player:GetGUIDLow()]-((oldLevel-player:GetLevel())*StatPointsPerLevel)
			CharDBExecute("UPDATE character_stat_points SET points="..statpoints_cache[player:GetGUIDLow()].." WHERE guid="..player:GetGUIDLow())
			player:SendBroadcastMessage("You've lost "..(oldLevel-player:GetLevel())*StatPointsPerLevel.." stat points. You now have "..statpoints_cache[player:GetGUIDLow()].." unallocated stat points.")
			player:SetMaxPower(3,1000)
		end
	else
	    statpoints_cache[player:GetGUIDLow()] = statpoints_cache[player:GetGUIDLow()]+((player:GetLevel()-oldLevel)*StatPointsPerLevel)
	    CharDBExecute("UPDATE character_stat_points SET points="..statpoints_cache[player:GetGUIDLow()].." WHERE guid="..player:GetGUIDLow())
	    player:SendBroadcastMessage("You've gained "..(player:GetLevel()-oldLevel)*StatPointsPerLevel.." stat points!")
		player:SetMaxPower(3,1000)
	end
	init_statvalues(player)
end

RegisterPlayerEvent(13, On_LevelUp)

--[[ON LEVELUP Talent]]
function give_token(event, player, oldLevel)

    if oldLevel >= 9 then
        player:AddItem(383081)
    end

end


RegisterPlayerEvent(13, give_token)

--[[SEND ADDON INFO]]
function SendShardLoginData(player)
	CacheMsg:AddBlock("SendData", Shard_ClassData, 1)
	CacheMsg:AddBlock("SendData", Shard_SpellData, 2)
	CacheMsg:AddBlock("SendData", Shard_CharData, 3)
	CacheMsg:Send(player)
	player:SendBroadcastMessage("[Server]: AddOn detected! Sent data.")
end

--[[RECIEVED ADDON INFO]]
function ReturnData(Player, Identifier)
	if (Identifier==1) then
		SendShardLoginData(Player)
	end
end

--[[RANDOM ENCHANTMENT GENERATOR]]
--[[
Enchantment slot test results:
0: WORKS
1: WORKS
2: DOES NOT WORK
3: DOES NOT WORK
4: DOES NOT WORK
5: WORKS
6: WORKS (DOES NOT DISPLAY)
7-11: DOES NOT WORK
]]

function RollEnchant(item)
	
	rarityRoll = math.random(100)
	local item_level = item:GetItemLevel()
	local itemClass = ""
	if (item:GetClass() == 2) then
		itemClass = "WEAPON"
	elseif (item:GetClass() == 4) then
		itemClass = "ARMOR"
	end
	if (rarityRoll <= 44) then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=1 AND exclusiveSubClass=NULL AND class='"..itemClass.."' OR exclusiveSubClass="..item:GetSubClass().." OR class='ANY' ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif (rarityRoll <= 64 and item_level >= 15) then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=2 AND exclusiveSubClass=NULL AND class='"..itemClass.."' OR exclusiveSubClass="..item:GetSubClass().." OR class='ANY' ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif (rarityRoll <= 79 and item_level >= 30) then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=3 AND exclusiveSubClass=NULL AND class='"..itemClass.."' OR exclusiveSubClass="..item:GetSubClass().." OR class='ANY' ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif (rarityRoll <= 92 and item_level >= 40) then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=4 AND exclusiveSubClass=NULL AND class='"..itemClass.."' OR exclusiveSubClass="..item:GetSubClass().." OR class='ANY' ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif (rarityRoll <= 100 and item_level >= 60) then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=5 AND exclusiveSubClass=NULL AND class='"..itemClass.."' OR exclusiveSubClass="..item:GetSubClass().." OR class='ANY' ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	end
end

function OnLoot(event, player, item, count)
	--[[
		item quality will be checked in order to allow for a higher chance to get random enchants
		item:GetQuality will return a number that will be equal to quality
		0 - grey
		1 - white
		2 - green
		3 - blue
		4 - purple
		5 - orange
		6 - red (not used?)
		7 - gold (bind to account)
	]]
	local chance_increaser = {100, 95, 65, 40, 15, 5} -- chances for each quality to get random_enchantments, the lower the number the higher the chance
	
	local slotBools		= {}
	local slotIDs		= {}
	local its			= 0
	local item_class = item:GetClass()
	local item_quality = item:GetQuality()
	
	if item_class == 2 or item_class == 4 then
	
		local boolRoll1		= math.random(100)
		if (boolRoll1 >= chance_increaser[(item_quality + 1)]) then 
			slotBools[1]	= true
			slotIDs[1]		= RollEnchant(item)
		else slotBools[1]	= false 
		end
		
		local boolRoll2		= math.random(100)
		if (boolRoll2 >= (chance_increaser[(item_quality + 1)]) + 10) and (slotBools[1] == true) then
			slotBools[2]	= true
			slotIDs[2]		= RollEnchant(item)
		else slotBools[2] = false
		end
		
		local boolRoll3		= math.random(100)
		if (boolRoll2 >=(chance_increaser[(item_quality + 1)]) + 15) and (slotBools[2] == true) then
			slotBools[3]	= true
			slotIDs[3]		= RollEnchant(item)
		else slotBools[3] = false
		end
		
		local boolRoll4		= math.random(100)
		if (boolRoll2 >=(chance_increaser[(item_quality + 1)]) + 25) and (slotBools[3] == true) then
			slotBools[4]	= true
			slotIDs[4]		= RollEnchant(item)
		else slotBools[4] = false
		end
		
		if (slotBools[1] == true) then
			for i, id in ipairs(slotIDs) do
				if (its == 2) then
					its = its + 3
				end
				if (slotBools[i] == true) then
					item:SetEnchantment(id, its)
					its = its + 1
				end
			end
		end	
	end
end

RegisterPlayerEvent(32, OnLoot)

--[[REST FUNCTIONALITY
function BreakRest(eventID, delay, pCall, player)
	player:SetPower(3, (player:GetPower(3)+10))
	if (player:IsMoving()) and (player:HasAura(818011)) then
		player:RemoveAura(818011)
		player:RemoveEvents()
	end
end
]]

function RestCheck(event, player, spell)
	if (spell:GetEntry()==818011) then
		player:SendBroadcastMessage("--You are resting--")
		if (player:GetAura(818012)) then
			player:RemoveAura(818012)
		end
		if (player:GetAura(818011)) then 
			spell:Cancel()
			player:RemoveAura(818011)
			player:RemoveEvents()
		-- else
			-- player:RegisterEvent(BreakRest, 50, 0)
		end
	end
end
RegisterPlayerEvent(5, RestCheck)


function TestFunction (event, player, spell)
	if (spell:GetEntry()==133) then
		player:SendBroadcastMessage("SkillLine Entry: "..spell:GetSkillLineEntry())
	end
end

RegisterPlayerEvent(5, TestFunction)

--[[COMMANDS]]
function ShardCommands(event, player, msg, Type, lang)
	if (player:GetGMRank()==3) then
		if (msg==ReloadSpellsCommand) then
			CacheSpells()
			return false
		end
		if (msg==SyncStatsCommand) then
			sync_stats(event, player)
			return false
		end
	end
end
RegisterPlayerEvent(18, ShardCommands)

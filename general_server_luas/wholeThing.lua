
local function On_LevelUp (event, player, oldLevel)

	player:AddItem(spell_essence, 1)
	
	if oldLevel >= 9 then
	
		player:AddItem(talent_essence, 1)
		
	end

end

RegisterPlayerEvent(13, On_LevelUp)



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
	
	local item_level = item:GetRequiredLevel()
	local itemClass = ""
	if (item:GetClass() == 2) then
		itemClass = "WEAPON"
	elseif (item:GetClass() == 4) then
		itemClass = "ARMOR"
	end
	if item_level < 10 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=1 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 20 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=2 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 30 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=3 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 40 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=4 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 50 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=5 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 60 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=6 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
		return query:GetUInt32(0)
	elseif item_level < 70 then
		local query = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier=7 AND (class='"..itemClass.."' OR class='ANY') ORDER BY RAND() LIMIT 1")
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
	local chance_increaser = {101, 95, 65, 40, 15, 5} -- chances for each quality to get random_enchantments, the lower the number the higher the chance
	
	local slotBools		= {}
	local slotIDs		= {}
	local its			= 0
	local item_class = item:GetClass()
	local item_quality = item:GetQuality()
	
	if item_class == 2 or item_class == 4 then
	
		local boolRoll1		= math.random(100)
		if (boolRoll1 >= chance_increaser[item_quality]) then 
			slotBools[1]	= true
			slotIDs[1]		= RollEnchant(item)
		else 
			slotBools[1]	= false 
		end
		
		if (slotBools[1] == true) then
			item:SetEnchantment(slotIDs[1], 5)
		end
	end
end

RegisterPlayerEvent(32, OnLoot)



function RemoveExhaustion(eventID, delay, pCall, player)
	local CurrentEnergy = player:GetPower(3)
	if (CurrentEnergy >= 200) and (player:GetAura(818013)) then
		player:RemoveAura(818013)
		player:RemoveEvents()
		player:SendBroadcastMessage("You feel refreshed.")
	end
end

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



--[[AUTO ATTACK]]
--function auto_attack(event, player, spell)
	--if (spell:GetEntry()==7712) then
		--if (player:GetPower(3)>=75) then
			--player:CastSpell(player, 818001, false)
		--else
			--player:CastSpell(player, 818013, false)
			--player:SendBroadcastMessage("|cffff0000You have become exhausted!|r")
			--player:RegisterEvent(RemoveExhaustion, 250, 0)
		--end
	--end
--end
--RegisterPlayerEvent(5, auto_attack)




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
			player:RegisterEvent(EnergyDrain, 1700, 0)
		end
	end
end
RegisterPlayerEvent(5, sprintcheck)


function RestCheck(event, player, spell)
	if (spell:GetEntry()==818011) then
		player:SendBroadcastMessage("I am resting. . .")
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



function On_LogIn (event, player)
	player:AddAura(7711, player)			--Modded in the DBC files, this is the aura that makes auto attacks cost energy.
	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)			--Language glitch band-aid.
	if (player:GetAura(818012)) then
		player:RegisterEvent(EnergyDrain, 1000, 0)
	end
end

RegisterPlayerEvent(3, On_LogIn)


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
	player:LearnSpell(818012)
	player:LearnSpell(818011)
	player:LearnSpell(818040)
	player:LearnSpell(818039)

end

RegisterPlayerEvent(30, first_login)



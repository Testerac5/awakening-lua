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
	local point_val = stat_point_query:GetInt32(0)
	local stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
	local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4)}
	
	if point_val > 0 then
		
		if point_val + (stats[1] + stats[2] + stats[3] + stats[4] + stats[5]) ~= (player:GetLevel() * 5) - 5 then
			local point_max = (player:GetLevel() * 5) - 5
			point_max = point_max - (stats[1] + stats[2] + stats[3] + stats[4] + stats[5])
			point_val = point_max
		end
		point_val = point_val - 1
		CharDBExecute("UPDATE character_stat_points SET points = "..point_val.." WHERE guid = "..player_guid)
	
		local stat_use = stat_names[stat]

	
		stats_query = CharDBQuery("SELECT "..stat_use.." FROM character_stat_allocation WHERE guid = "..player_guid)
		local stat_value = stats_query:GetInt32(0)
		
		
		stat_value = stat_value + 1
		
		CharDBExecute("UPDATE character_stat_allocation set "..stat_use.." = "..stat_value.." WHERE guid = "..player_guid)
		
		
		stats_query = CharDBQuery("SELECT str, sta, agi, inte, spi FROM character_stat_allocation WHERE guid = "..player_guid)
		
		stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4), point_val}
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
	local points_query = CharDBQuery("SELECT points FROM character_stat_points WHERE guid = "..player_guid)
	local point_val = points_query:GetInt32(0)
	local stats = {stats_query:GetInt32(0), stats_query:GetInt32(1), stats_query:GetInt32(2), stats_query:GetInt32(3), stats_query:GetInt32(4)}
	
	if stats[stat] > 0 then

		
		if point_val + (stats[1] + stats[2] + stats[3] + stats[4] + stats[5]) ~= (player:GetLevel() * 5) - 5 then
			local point_max = (player:GetLevel() * 5) - 5
			point_max = point_max - (stats[1] + stats[2] + stats[3] + stats[4] + stats[5])
			point_val = point_max
		end
		point_val = point_val + 1
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

	local all_spell_lists = {druid_balance_spells, druid_feral_spells, druid_restoration_spells,
							   hunter_beastmastery_spells, hunter_marksmanship_spells, hunter_survival_spells,
							   mage_arcane_spells, mage_fire_spells, mage_frost_spells,
							   paladin_holy_spells, paladin_protection_spells, paladin_retribution_spells,
							   priest_discipline_spells, priest_holy_spells, priest_shadow_spells,
							   rogue_assassination_spells, rogue_combat_spells, rogue_subtlety_spells,
							   shaman_elemental_spells, shaman_enhancement_spells, shaman_restoration_spells,
							   warlock_affliction_spells, warlock_demonology_spells, warlock_destruction_spells,
							   warrior_arms_spells, warrior_fury_spells, warrior_protection_spells}
							   
	if player:HasItem(spell_reset_token) == true or free_spell_reset == true then						   
		for listloc,spec in ipairs(all_spell_lists) do
			for loc,spell in ipairs(spec) do
				local AE_cost = spell[2]
				local TE_cost = spell[3]
				local spellid = spell[1]
				
				if player:HasSpell(spellid) == true then
					player:RemoveSpell(spellid)
					player:AddItem(spell_essence, AE_cost)
					if TE_cost ~= 0 then
						player:Additem(talent_essence, TE_cost)
					end
					if player:HasAura(spellid) == true then
						player:RemoveAura(spellid)
					end
				end
			end
		end
		player:SendBroadcastMessage("Refund Complete for Spells")
	else
		player:SendBroadcastMessage("You are missing the required token to do this!")
	end
end




function MyHandlers.ResetTalents(player)

	local all_talent_lists = {druid_balance_talents, druid_feral_talents, druid_restoration_talents,
							   hunter_beastmastery_talents, hunter_marksmanship_talents, hunter_survival_talents,
							   mage_arcane_talents, mage_fire_talents, mage_frost_talents,
							   paladin_holy_talents, paladin_protection_talents, paladin_retribution_talents,
							   priest_discipline_talents, priest_holy_talents, priest_shadow_talents,
							   rogue_assassination_talents, rogue_combat_talents, rogue_subtlety_talents,
							   shaman_elemental_talents, shaman_enhancement_talents, shaman_restoration_talents,
							   warlock_affliction_talents, warlock_demonology_talents, warlock_destruction_talents,
							   warrior_arms_talents, warrior_fury_talents, warrior_protection_talents}
							   
	if player:HasItem(talent_reset_token) == true or free_talent_reset == true then
		player:RemoveItem(talent_reset_token, 1)
		for i,v in ipairs(all_talent_lists) do
			
			for listloc,talent in ipairs(v) do
				local spell_removed = false
				local rank_removed = 0
				local AE_cost = talent[3]
				local TE_cost = talent[4]
				for slot,spellid in ipairs(talent[2]) do
					if player:HasSpell(spellid) == true then
						spell_removed = true
						rank_removed = slot
						player:RemoveSpell(spellid)
						
						if player:HasAura(spellid) == true then
							player:RemoveAura(spellid)
						end
						
						player:SendBroadcastMessage("removing: "..spellid)
					end
				end

				if spell_removed == true then
					player:AddItem(talent_essence, (rank_removed*TE_cost))
					if AE_cost ~= 0 then
						player:AddItem(spell_essence, (rank_removed*AE_cost))
					end
				end
			end
			
			
		end
		player:SendBroadcastMessage("Refund Complete for talents")
	else
		player:SendBroadcastMessage("You are missing the required token to do this!")
	end

end


function MyHandlers.SendAmountOfSpells(player, class, Spec)

	local pass_1 = nil
	local pass_2 = nil

	if class == "DRUID" and Spec == "BALANCE" then
		pass_1 = druid_balance_spells_count
		pass_2 = druid_balance_spells
	elseif class == "DRUID" and Spec == "FERAL" then
		pass_1 = druid_feral_spells_count
		pass_2 = druid_feral_spells
	elseif class == "DRUID" and Spec == "RESTORATION" then
		pass_1 = druid_restoration_spells_count
		pass_2 = druid_restoration_spells
	elseif class == "HUNTER" and Spec == "BEASTMASTERY" then
		pass_1 = hunter_beastmastery_spells_count
		pass_2 = hunter_beastmastery_spells
	elseif class == "HUNTER" and Spec == "MARKSMANSHIP" then
		pass_1 = hunter_marksmanship_spells_count
		pass_2 = hunter_marksmanship_spells
	elseif class == "HUNTER" and Spec == "SURVIVAL" then
		pass_1 = hunter_survival_spells_count
		pass_2 = hunter_survival_spells
	elseif class == "MAGE" and Spec == "ARCANE" then
		pass_1 = mage_arcane_spells_count
		pass_2 = mage_arcane_spells
	elseif class == "MAGE" and Spec == "FIRE" then
		pass_1 = mage_fire_spells_count
		pass_2 = mage_fire_spells
	elseif class == "MAGE" and Spec == "FROST" then
		pass_1 = mage_frost_spells_count
		pass_2 = mage_frost_spells
	elseif class == "PALADIN" and Spec == "HOLY" then
		pass_1 = paladin_holy_spells_count
		pass_2 = paladin_holy_spells
	elseif class == "PALADIN" and Spec == "RETRIBUTION" then
		pass_1 = paladin_retribution_spells_count
		pass_2 = paladin_retribution_spells
	elseif class == "PALADIN" and Spec == "PROTECTION" then
		pass_1 = paladin_protection_spells_count
		pass_2 = paladin_protection_spells
	elseif class == "PRIEST" and Spec == "DISCIPLINE" then
		pass_1 = priest_discipline_spells_count
		pass_2 = priest_discipline_spells
	elseif class == "PRIEST" and Spec == "HOLY" then
		pass_1 = priest_holy_spells_count
		pass_2 = priest_holy_spells
	elseif class == "PRIEST" and Spec == "SHADOW" then
		pass_1 = priest_shadow_spells_count
		pass_2 = priest_shadow_spells
	elseif class == "ROGUE" and Spec == "ASSASSINATION" then
		pass_1 = rogue_assassination_spells_count
		pass_2 = rogue_assassination_spells
	elseif class == "ROGUE" and Spec == "COMBAT" then
		pass_1 = rogue_combat_spells_count
		pass_2 = rogue_combat_spells
	elseif class == "ROGUE" and Spec == "SUBTLETY" then
		pass_1 = rogue_subtlety_spells_count
		pass_2 = rogue_subtlety_spells
	elseif class == "SHAMAN" and Spec == "ELEMENTAL" then
		pass_1 = shaman_elemental_spells_count
		pass_2 = shaman_elemental_spells
	elseif class == "SHAMAN" and Spec == "ENHANCEMENT" then
		pass_1 = shaman_enhancement_spells_count
		pass_2 = shaman_enhancement_spells
	elseif class == "SHAMAN" and Spec == "RESTORATION" then
		pass_1 = shaman_restoration_spells_count
		pass_2 = shaman_restoration_spells
	elseif class == "WARLOCK" and Spec == "AFFLICTION" then
		pass_1 = warlock_affliction_spells_count
		pass_2 = warlock_affliction_spells
	elseif class == "WARLOCK" and Spec == "DEMONOLOGY" then
		pass_1 = warlock_demonology_spells_count
		pass_2 = warlock_demonology_spells
	elseif class == "WARLOCK" and Spec == "DESTRUCTION" then
		pass_1 = warlock_destruction_spells_count
		pass_2 = warlock_destruction_spells
	elseif class == "WARRIOR" and Spec == "ARMS" then
		pass_1 = warrior_arms_spells_count
		pass_2 = warrior_arms_spells
	elseif class == "WARRIOR" and Spec == "FURY" then
		pass_1 = warrior_fury_spells_count
		pass_2 = warrior_fury_spells
	elseif class == "WARRIOR" and Spec == "PROTECTION" then
		pass_1 = warrior_protection_spells_count
		pass_2 = warrior_protection_spells
	elseif class == "GENERAL" and Spec == "GENERAL" then
		pass_1 = general_spells_count
		pass_2 = general_spells
	end
	
	sendAmountOfSpells(AIO.Msg(), player, pass_1, pass_2):Send(player)

end

function sendAmountOfSpells(msg, player, spellCount, spellList)

	return msg:Add("sideBar", "GetSpellCount", spellCount, spellList)

end

function sendButtonToChangeSpells(msg, player, i)

	return msg:Add("sideBar", "ChangeLearnButton", i)

end


function MyHandlers.LearnThisSpell(player, got_spell, i)
	local successful = true
	local player_has_currency = true
	local currency_one = got_spell[2]
	local currency_two = got_spell[3]
	local spellID = got_spell[1]
	
	
	if got_spell[2] ~= 0 then
		if player:HasItem(spell_essence, currency_one) == false then
			player_has_currency = false
			successful = false
		end
	end
	
	if got_spell[3] ~= 0 then
		if player:HasItem(talent_essence, currency_two) == false then
			player_has_currency = false
			successful = false
		end
	end
	
	if player_has_currency == true and currency_one ~= 0 then
		player:RemoveItem(spell_essence, currency_one)
	end
	
	if player_has_currency == true and currency_two ~= 0 then
		player:RemoveItem(talent_essence, currency_two)
	end
	
	if player_has_currency == true then
		player:LearnSpell(spellID)
	end
	
	if successful == false then
		player:SendBroadcastMessage("You do not have the required currency!")
		
	else
		sendButtonToChangeSpells(AIO.Msg(), player, i):Send(player)
	end
	
end

function MyHandlers.GetAllBGs(player, ClassSpec)
	local bgList = {druid_balance_bgs, druid_feral_bgs, druid_restoration_bgs,
	hunter_beastmastery_bgs, hunter_marksmanship_bgs, hunter_survival_bgs,
	mage_arcane_bgs, mage_fire_bgs, mage_frost_bgs,
	paladin_holy_bgs, paladin_protection_bgs, paladin_retribution_bgs,
	priest_discipline_bgs, priest_holy_bgs, priest_shadow_bgs,
	rogue_assassination_bgs, rogue_combat_bgs, rogue_subtlety_bgs,
	shaman_elemental_bgs, shaman_enhancement_bgs, shaman_restoration_bgs,
	warlock_affliction_bgs, warlock_demonology_bgs, warlock_destruction_bgs,
	warrior_arms_bgs, warrior_fury_bgs, warrior_protection_bgs}
	
	local talentList = {}
	local tabIndex = 0
	
	local ClassSpecList = {"DRUIDBALANCE", "DRUIDFERAL", "DRUIDRESTORATION",
						   "HUNTERBEASTMASTERY", "HUNTERMARKSMANSHIP", "HUNTERSURVIVAL",
						   "MAGEARCANE", "MAGEFIRE", "MAGEFROST",
						   "PALADINHOLY", "PALADINPROTECTION", "PALADINRETRIBUTION",
						   "PRIESTDISCIPLINE", "PRIESTHOLY", "PRIESTSHADOW",
						   "ROGUEASSASSINATION", "ROGUECOMBAT", "ROGUESUBTLETY",
						   "SHAMANELEMENTAL", "SHAMANENHANCEMENT", "SHAMANRESTORATION",
						   "WARLOCKAFFLICTION", "WARLOCK", "DEMONOLOGY", "WARLOCKDESTRUCTION",
						   "WARRIORARMS", "WARRIORFURY", "WARRIORPROTECTION"}
			
	local ListOfTalentLists = {druid_balance_talents, druid_feral_talents, druid_restoration_talents,
							   hunter_beastmastery_talents, hunter_marksmanship_talents, hunter_survival_talents,
							   mage_arcane_talents, mage_fire_talents, mage_frost_talents,
							   paladin_holy_talents, paladin_protection_talents, paladin_retribution_talents,
							   priest_discipline_talents, priest_holy_talents, priest_shadow_talents,
							   rogue_assassination_talents, rogue_combat_talents, rogue_subtlety_talents,
							   shaman_elemental_talents, shaman_enhancement_talents, shaman_restoration_talents,
							   warlock_affliction_talents, warlock_demonology_talents, warlock_destruction_talents,
							   warrior_arms_talents, warrior_fury_talents, warrior_protection_talents}
	local ListOfTabIndexes = {druid_balance_talents_tab, druid_feral_talents_tab, druid_restoration_talents_tab,
							   hunter_beastmastery_talents_tab, hunter_marksmanship_talents_tab, hunter_survival_talents_tab,
							   mage_arcane_talents_tab, mage_fire_talents_tab, mage_frost_talents_tab,
							   paladin_holy_talents_tab, paladin_protection_talents_tab, paladin_retribution_talents_tab,
							   priest_discipline_talents_tab, priest_holy_talents_tab, priest_shadow_talents_tab,
							   rogue_assassination_talents_tab, rogue_combat_talents_tab, rogue_subtlety_talents_tab,
							   shaman_elemental_talents_tab, shaman_enhancement_talents_tab, shaman_restoration_talents_tab,
							   warlock_affliction_talents_tab, warlock_demonology_talents_tab, warlock_destruction_talents_tab,
							   warrior_arms_talents_tab, warrior_fury_talents_tab, warrior_protection_talents_tab}
							   
	for i,v in ipairs(ClassSpecList) do
		if ClassSpec == v then
			talentList = ListOfTalentLists[i]
			tabIndex = ListOfTabIndexes[i]
		end
	end
	
	local known_talents_list = {}

	for i,v in ipairs(talentList) do
		local spellids = v[2]
		local know_a_spell = false
		
		for p,t in ipairs(spellids) do
			if player:HasSpell(t) == true then
				know_a_spell = p
			end
		end
		
		table.insert(known_talents_list, know_a_spell)
		
	end
	
	sendBGListToPlayer(AIO.Msg(), player, ClassSpec, bgList, talentList, known_talents_list, tabIndex):Send(player)

end


function sendBGListToPlayer(msg, player, ClassSpec, bgList, talentList, known_talents_list, tabIndex)

	return msg:Add("sideBar", "SetBackgroundImages", ClassSpec, bgList, talentList, known_talents_list, tabIndex)

end


function MyHandlers.LearnThisTalent(player, attached_talent, indexAt)
	
	local successful = true
	local player_has_currency = true
	local currency_one = attached_talent[2]
	local currency_two = attached_talent[3]
	local spellID = attached_talent[1]
	
	
	if currency_one ~= 0 then
		if player:HasItem(spell_essence, currency_one) == false then
			player_has_currency = false
			successful = false
		end
	end
	
	if currency_two ~= 0 then
		if player:HasItem(talent_essence, currency_two) == false then
			player_has_currency = false
			successful = false
		end
	end
	
	if player_has_currency == true and currency_one ~= 0 then
		player:RemoveItem(spell_essence, currency_one)
	end
	
	if player_has_currency == true and currency_two ~= 0 then
		player:RemoveItem(talent_essence, currency_two)
	end
	
	if player_has_currency == true then
		player:LearnSpell(spellID)
	end
	
	if successful == false then
		player:SendBroadcastMessage("You do not have the required currency!")
		SendGoBackTalent(AIO.Msg(), player, attached_talent, indexAt):Send(player)
		
	else
		sendUpdatedTalent(AIO.Msg(), player, attached_talent, indexAt):Send(player)
	end
	
end

function sendUpdatedTalent(msg, player, attached_talent, indexAt)

	return msg:Add("sideBar", "UpdateTalent", attached_talent, indexAt)

end

function SendGoBackTalent(msg, player, attached_talent, indexAt)
	return msg:Add("sideBar", "TalentGoBack", attached_talent, indexAt)
end



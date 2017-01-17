local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("EnchantReRoll", {})

local ReforgeAltar = 8000051
local ReforgeAltar_menu = 45004

--gossip part
	 function enchantReRoll_CloseMenu(msg,player)

	return msg:Add("EnchantReRoll", "EnchantReRoll_Close")
end

	 function enchantReRoll_OpenMenu(msg,player)
	return msg:Add("EnchantReRoll", "EnchantReRoll_Init")
end

local function OnGossipHello_ReforgeAltar(event, player, Altar)
player:GossipClearMenu()
enchantReRoll_OpenMenu(AIO.Msg(), player):Send(player)
player:GossipSendMenu(1, Altar, ReforgeAltar_menu) 
player:GossipComplete()
end
RegisterGameObjectGossipEvent(ReforgeAltar, 1, OnGossipHello_ReforgeAltar)

 function GameobjectCheck(player)
 	local altar = nil
 	altar = player:GetNearestGameObject(10, ReforgeAltar)
 	if (altar) then
		return true
	end
	enchantReRoll_CloseMenu(AIO.Msg(), player):Send(player)
	return false
	end

local function PlayerIsFar(event, go, diff)
	for k,player in pairs(go:GetPlayersInRange(60)) do
		GameobjectCheck(player)
	end
end
 RegisterGameObjectEvent(ReforgeAltar, 1, PlayerIsFar)
--gossip part

function EnchantItemCheck(player,item)
	   if not(GameobjectCheck(player)) then
   	return false
   end
   if (item:GetClass() == 2 or item:GetClass() == 4) then
       if (item:GetQuality() >= 3) then
       	return true
       end
   end

   player:SendBroadcastMessage("This item can't be reforged")
   return false
end

function EnchantItemCost(item)
	local cost = nil
	cost = item:GetItemLevel() * 2285
	return cost
end

function EnchantItemTier(item)
	local Tier = 1
	local level = item:GetRequiredLevel()
	if (1 <= level) and (level <=9) then
		Tier = 1
		elseif (10 <= level) and (level <=19) then
			Tier = 2
			elseif (20 <= level) and (level <=29) then
				Tier = 3
				elseif (30 <= level) and (level <=39) then
					Tier = 4
					elseif (40 <= level) and (level <=49) then
						Tier = 5
						elseif (50 <= level) and (level <=59) then
							Tier = 6
							elseif (level >= 60) then
								Tier = 7
		end
	return Tier
end
--MAIN SET ITEM FUNCTION
 function MyHandlers.SetItem(player,bag,slot)
 local item = player:GetItemByPos(bag,slot)
	if (EnchantItemCheck(player,item)) then
	local itemlink = GetItemLink(item:GetEntry())
	local effect = nil
	local cost = EnchantItemCost(item)

	if (item:GetEnchantmentSpellId(5)) then
		effect = item:GetEnchantmentSpellId(5)
	else
		effect = 964998
	end

	enchantReRoll_PlaceItem(AIO.Msg(), player,itemlink, effect, cost,bag,slot):Send(player)
	end
end

 function enchantReRoll_PlaceItem(msg,player,item,effect,cost,bag,slot)
	return msg:Add("EnchantReRoll", "EnchantReRoll_PlaceItem", item,effect,cost,bag,slot)
end
--end

--MAIN REFORGE ITEM FUNCTION
function MyHandlers.ReforgeItem_Prep(player,bag,slot)
local item = player:GetItemByPos(bag,slot)
	if (EnchantItemCheck(player,item)) then
		local cost = EnchantItemCost(item)

			if (cost > player:GetCoinage()) then
			player:SendBroadcastMessage("You don't have enough money to do that")
			return false
		end

			player:CastSpell(player, 964998)
	end
end

function MyHandlers.ReforgeItem(player,bag,slot)
	local item = player:GetItemByPos(bag,slot)
	if (EnchantItemCheck(player,item)) then

		local cost = EnchantItemCost(item)
		local class = item:GetClass()
		local enchantTier = EnchantItemTier(item)
		local neweffect = math.random(1,10)
		local neweffectSQL = nil

		if (class == 4) then
			class = "ANY"
			elseif (class == 2) then
				class = "WEAPON"
			end

		if (cost > player:GetCoinage()) then
			player:SendBroadcastMessage("You don't have enough money to do that")
			return false
		else
			player:SetCoinage(player:GetCoinage() - cost)
		end

		--[[local enchantTierSQL = WorldDBQuery("SELECT tier FROM item_enchantment_random_tiers WHERE enchantID = "..effect..";")
		if not(enchantTierSQL) then
		player:SendBroadcastMessage("Reforge Failed")
		return false
		else
		enchantTier = enchantTierSQL:GetInt32(0)
		end]]--

		if (class == "ANY") then
			neweffectSQL = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier = "..enchantTier.." AND class = '"..class.."';")
		else
			neweffectSQL = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier = "..enchantTier..";")
		end
		--choosing random row from our query
		if (neweffectSQL) then
			if (neweffectSQL:GetRowCount()>1) then
		for i = 1, math.random(1, (neweffectSQL:GetRowCount()-1)) do
			neweffectSQL:NextRow()
		end
	end
		neweffect = neweffectSQL:GetInt32(0)
		item:SetEnchantment(neweffect, 5)
		enchantReRoll_Reforge(AIO.Msg(),player,item):Send(player)
	else
		player:SendBroadcastMessage("Reforge Failed")
	end
	end
end

function enchantReRoll_Reforge(msg,player,item)
	local neweffect = nil
	if (item:GetEnchantmentSpellId(5)) then
		neweffect = item:GetEnchantmentSpellId(5)
	else
		neweffect = 964998
	end
	return msg:Add("EnchantReRoll", "EnchantReRollMain_Reforge", neweffect)
end
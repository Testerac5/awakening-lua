local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("EnchantReRoll", {})

function EnchantItemCheck(player,item)
	if (item:GetClass() == 2 or item:GetClass() == 4) then
       if (item:GetEnchantmentId(5) ~= 0) then
       	return true
       end
   end
   player:SendBroadcastMessage("This item can't be reforged")
   return false
end

function EnchantItemCost(item)
	local cost = nil
	cost = item:GetItemLevel()*10000
	return cost
end
--MAIN SET ITEM FUNCTION
 function MyHandlers.SetItem(player,bag,slot)
 local item = player:GetItemByPos(bag,slot)
	if (EnchantItemCheck(player,item)) then

	local itemlink = GetItemLink(item:GetEntry())
	local effect = item:GetEnchantmentSpellId(5)
	local cost = EnchantItemCost(item)/10000

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
		local effect = item:GetEnchantmentSpellId(5)
		local cost = EnchantItemCost(item)
		local class = item:GetClass()
		local enchantTier = 1
		local neweffect = math.random(1,10)

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

		enchantTier = WorldDBQuery("SELECT tier FROM item_enchantment_random_tiers WHERE enchantID = "..effect..";"):GetInt32(0)
		local neweffectSQL = WorldDBQuery("SELECT enchantID FROM item_enchantment_random_tiers WHERE tier = "..enchantTier.." AND class = '"..class.."';")
		--choosing random row from our query
		if (neweffectSQL) then
		for i = 1, math.random(1, neweffectSQL:GetRowCount()) do
			neweffectSQL:NextRow()
		end
		neweffect = neweffectSQL:GetInt32(0)
		item:SetEnchantment(neweffect, 5)

		enchantReRoll_Reforge(AIO.Msg(),player,neweffect):Send(player)
	else
		player:SendBroadcastMessage("Your item can't be reforged")
	end
	end
end

function enchantReRoll_Reforge(msg,player,neweffect)
	return msg:Add("EnchantReRoll", "EnchantReRollMain_Reforge", neweffect)
end

local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("PvP", {})

local guid_linking_table = {}
item_table = {}
local remove_table = {}
all_chests = {}

local playerdeath = true
local creaturedeath = true
local leveldiff = 6

-- this function is never called for some unknown reason, known bug with ElunaCore
function Remove_FullLootContainer(event, delay, call, object)
	print("I got here!")
	print("I got here!")
	local nearbyplayers = object:GetPlayersInRange(100)
	for k, v in pairs(nearbyplayers) do
		v:SendBroadcastMessage("|CFFFF8040The sack of items turns to dust, and blows away with the wind.|r")
	end
	object:Despawn()
	object:RemoveFromWorld(false)
	FullLootFrame:Hide()
    guid_linking_table[object:GetGUIDLow()] = nil
	item_table[object:GetGUIDLow()] = nil
	print("Chest removed from world")
end


local function EntropyPvP(event, pKiller, pKilled)
	local check_safe = false
	local pKiller_loc = pKiller:GetMapId()
	print(pKiller_loc)
	local spawnType = 2
	local instanceID = pKiller:GetInstanceId()
	for i,v in ipairs(safety_ids) do
		if v == pKiller_loc then
			check_safe = true
			break
		end
	end
	if (playerdeath==true and check_safe == false) then
		local killed_color = ClassColorCodes[pKilled:GetClass()]
		local killer_color = ClassColorCodes[pKiller:GetClass()]
		local killerguild_name = ", a Lone Wolf"
		local killedguild_name = ", a Lone Wolf"
		--Fetch Guild Names
		if (pKiller:GetGuildName()~=nil) then
			killerguild_name = " of "..pKiller:GetGuildName()..""
		end
		if (pKilled:GetGuildName()~=nil) then
			killedguild_name = " of"..pkilled:GetGuildName()..""
		end
		
		if ((pKiller:GetLevel()-pKilled:GetLevel())<=leveldiff) then
		
			local pKilledGUID = pKilled:GetGUIDLow()
			local pKillerGUID = pKiller:GetGUIDLow()
			local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
			local ContainerID = 818002
			local FullLootContainer = PerformIngameSpawn(spawnType,ContainerID,pKiller_loc,instanceID, x, y, z, o)	--Spawn a Sack of Belongings
			guid_linking_table[FullLootContainer:GetGUIDLow()] = pKilled:GetGUIDLow()
			--Get Items
			local bagslot = 255
			local inven_ticker = 0
			local item_ticker = 0
			local maxitems = 25 --Equal to amount of buttons that I have declared.
			item_table[FullLootContainer:GetGUIDLow()] = {}
			remove_table[FullLootContainer:GetGUIDLow()] = {}
			repeat
				local SlotRange = 35
				inven_ticker = inven_ticker+1
				local bagToTake = math.random(3)
				if bagToTake < 3 then
					SlotRange = 38
					bagToTake = 255
				else
					bagToTake = math.random(4)
					bagToTake = bagToTake + 18
				end
				local slotToTake = math.random(SlotRange)
				
				local checkitem = pKilled:GetItemByPos(bagToTake, slotToTake)
				if (checkitem~=nil) and (checkitem:IsBag()==false) and (checkitem:GetEntry()~=6948) then
					item_ticker = item_ticker+1
					table.insert (item_table[FullLootContainer:GetGUIDLow()], {checkitem:GetItemLink(), checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()), pKilled:GetName()})
					table.insert (remove_table[FullLootContainer:GetGUIDLow()], {item_ticker, false})
					pKilled:RemoveItem(checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()))
				end
			until (inven_ticker>=38) or (item_ticker>=maxitems)
			--Kill Announcer
			local DeathAnnouncements = {
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", was slain by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", met the maker to the hand of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", was vanquished by |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", has fallen to |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name.."!",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", died a swift death, courtesy of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..".",
				"[PvP]: |CFF"..killed_color..""..pKilled:GetName().."|r"..killedguild_name..", wanted a piece of |CFF"..killer_color..""..pKiller:GetName().."|r"..killerguild_name..", but bit off a little more than they could chew!"
			}
			if (EnableDeathAnnouncer==true) then
				local DeathAnnounce_Roll = math.random(1,6)
				SendWorldMessage(DeathAnnouncements[DeathAnnounce_Roll])
			end
		else
			SendWorldMessage("[PvP]: |cffff0000Everyone give a big round of applause to|r |CFF"..killer_color..""..pKiller:GetName().."|r |cffff0000"..killerguild_name..", whom is level "..pKiller:GetLevel()..", killed|r |CFF"..killed_color..""..pKilled:GetName().."|r|cffff0000, a level "..pKilled:GetLevel()..".|r")
		end
	end
end


local function CreatureDeath (event, pKiller, pKilled)
	local check_safe = false
	local pKilled_loc = pKilled:GetMapId()
	local spawnType = 2
	local instanceID = pKilled:GetInstanceId()
	for i,v in ipairs(safety_ids) do
		if v == pKilled_loc then
			check_safe = true
			break
		end
	end

	if (creaturedeath==true and check_safe == false) then
		local pKilledGUID = pKilled:GetGUIDLow()
		local x,y,z,o = pKilled:GetX(),pKilled:GetY(),pKilled:GetZ(),pKilled:GetO()
		local ContainerID = 818002
		local kill_message = math.random(1,6)
		local FullLootContainer = PerformIngameSpawn(spawnType,ContainerID,pKilled_loc,instanceID, x, y, z, o, false, 10)	--Spawn a Sack of Belongings
		guid_linking_table[FullLootContainer:GetGUIDLow()] = pKilled:GetGUIDLow()
		--Get Items
		local bagslot = 255
		local inven_ticker = 0
		local item_ticker = 0
		local maxitems = 25 --Equal to amount of buttons that I have declared.
		item_table[FullLootContainer:GetGUIDLow()] = {}
		repeat
			local SlotRange = 35
			inven_ticker = inven_ticker+1
			local bagToTake = math.random(2)
			if bagToTake == 1 then
				SlotRange = 38
				bagToTake = 255
			else
				bagToTake = math.random(4)
				bagToTake = bagToTake + 4
			end
			local slotToTake = math.random(SlotRange)
				
			local checkitem = pKilled:GetItemByPos(bagToTake, slotToTake)
			safe_to_take = true
			if checkitem:GetClass() == 12 then
			
				safe_to_take = false
				
			elseif checkitem:GetClass() == 0 then
			
				if checkitem:GetDisplayId() == 34802 then
				
					safe_to_take = false
					
				end
				
			end
			
			if (checkitem~=nil) and (checkitem:IsBag()==false) and (checkitem:GetEntry()~=6948) and safe_to_take == true then
				item_ticker = item_ticker+1
				table.insert (item_table[FullLootContainer:GetGUIDLow()], {checkitem:GetItemLink(), checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()), pKilled:GetName()})
				pKilled:RemoveItem(checkitem:GetEntry(), pKilled:GetItemCount(checkitem:GetEntry()))
			end
		until (inven_ticker>=38) or (item_ticker>=maxitems)
	end
end




local function Init_FullLootFrame(event, player, object)

	local itemNumber = 0
	local playerKilledName = "h"
	local itemList = {}
	local objectid = object:GetGUIDLow()

	for k, v in ipairs(item_table[objectid]) do
	
		if v[1] ~= nil then
	
			table.insert (itemList, v)
			
			itemNumber = itemNumber + 1
			
		end
	
	end
	
	
	sendItemsToPlayer(AIO.Msg(), player, itemNumber, itemList, objectid):Send(player)

end

function sendItemsToPlayer(msg, player, itemNumber, itemList, playerKilledName, object)

	return msg:Add("PvP", "ReceiveItems", itemNumber, itemList, playerKilledName)

end

function MyHandlers.AddPlayerItem(player, itemEntry, itemCount, object)

	for i,v in pairs(item_table[object]) do
		if v[2] == itemEntry then
			player:AddItem(itemEntry, itemCount)
			item_table[object][i][2] = nil
			item_table[object][i][1] = nil
			item_table[object][i][3] = nil
		end
	
	end

end

local function Container_Interact(event, player, object)
	Init_FullLootFrame(event, player, object)
	object:Despawn()
	return false
end



RegisterPlayerEvent(6, EntropyPvP)	
RegisterPlayerEvent(8, CreatureDeath)
RegisterGameObjectGossipEvent(818002, 1, Container_Interact)



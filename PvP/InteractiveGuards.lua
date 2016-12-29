			--[[INTERACTIVE GUARDS SYSTEM]]--

--Loading guard ids--
local Guards_Entry = {}

local Guard_Factions = {
	88, -- dwarwes of dungarok
	11, -- stormwind guards
	57, -- ironforge
	56, -- night watch
	71, -- undercity
	85, -- orgrimmar
	64, -- gnomerigan
	473, -- chernii woron
	1625, -- serebryanni rassvet
	814, -- serebryanni rassvet
	123, -- arathor
	1054, -- wildhammer dwarf
	--1603, -- lunosvet
	76, -- dalaran mages (EASTERN KINGDOM)
	79, -- darnas
	1575, -- straji pustoti
	412, -- oskvernitely
	1577, -- liga arathora
	105, -- thousand needles guards (horde)
	83, -- thunder bluff
	150, -- theramore
	877, -- sen'jin watchers
	1515, -- warsong guard (barrens)
}
for k, v in pairs(Guard_Factions) do 
	local entry = WorldDBQuery("SELECT entry FROM creature_template WHERE faction = "..v..";")
	if (entry) then
		for i = 1, entry:GetRowCount() do
			table.insert(Guards_Entry, entry:GetInt32(0))
			entry:NextRow()
		end
	end
	end

	--attack player when player attacks player of the same faction
local function Guard_MainAction(event, player, enemy)
	if (player:ToPlayer() and enemy:ToPlayer()) and (( (player:IsAlliance() and enemy:IsAlliance()) or (player:IsHorde() and enemy:IsHorde()) )) then
		local FriendlyCreatures = player:GetFriendlyUnitsInRange(60)

		for n, creature in pairs(FriendlyCreatures) do
			for m,faction_g in pairs(Guard_Factions) do
				if (faction_g == creature:GetFaction()) then
					creature:SetFaction(7)
					creature:AttackStart(player)
				end
			end
		end
	end
end

RegisterPlayerEvent(33, Guard_MainAction)

local function Guard_Back(event, creature)
	local faction = WorldDBQuery("SELECT faction FROM creature_template where entry = '"..creature:GetEntry().."';")
		creature:SetFaction(faction:GetInt32(0))
		creature:MoveHome()
end
for k,v in pairs(Guards_Entry) do
	RegisterCreatureEvent(v, 2, Guard_Back)
	RegisterCreatureEvent(v, 5, Guard_Back)
	--RegisterCreatureEvent(v, 23, Guard_Back)
end
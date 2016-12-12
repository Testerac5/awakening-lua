local AIO = AIO or require ("AIO")

if AIO.AddAddon() then
	return
end

local tTHandler = AIO.AddHandlers ("TooltipAIO", {})

local TipNum

local TipID

local spellCheck = false

local modCost

local modCastTime

local modRange

local modCooldown

local tempNum

local pTemplateTable

local skipCheck


--TODO: fill TaggedSpells and template lists
--TODO: make the tooltips pretty(?)


--used to read tooltip
local tab = {}

--format: [spellid] = templateNumber
--templateNumber refers to the templateTable.
local TaggedSpells = 
{
	[100] = 1,
	[772] = 2,
	[6343] = 3,
	[8198] = 3,
	[8204] = 3,
	[8205] = 3,
	[11580] = 3,
	[11581] = 3,
	[25264] = 3,
	[47501] = 3,
	[47501] = 3,
	[6673] = 4,
	[5242] = 4,
	[6192] = 4,
	[11549] = 4,
	[11550] = 4,
	[11551] = 4,
	[25289] = 4,
	[2048] = 4,
	[47436] = 4,
	[34428] = 5,
	[72] = 6,
	[1671] = 6,
	[1672] = 6,
	[29704] = 6,
	[78] = 4,
	[284] = 4,
	[285] = 4,
	[1608] = 4,
	[11564] = 4,
	[11565] = 4,
	[11566] = 4,
	[11567] = 4,
	[25286] = 4,
	[29707] = 4,
	[30324] = 4,
	[47449] = 4,
	[47450] = 4,
	[469] = 4,
	[47439] = 4,
	[47440] = 4,
	[676] = 6,
	[694] = 6,
	[7400] = 6,
	[7402] = 6,
	[20559] = 6,
	[20560] = 6,
	[25266] = 6,
	[47504] = 6,
	[845] = 4,
	[7369] = 4,
	[11608] = 4,
	[11609] = 4,
	[20569] = 4,
	[25231] = 4,
	[47519] = 4,
	[47520] = 4
	
--Blink uses templateNumber 1.
--so does Fire Blast
}

--format: [templateNumber] = {powerLine, powerType, cooldownLine, rangeLine, castLine}
--powerLine tells which line cost is located. powerType is the type of resource.
--cooldownLine is which line cooldowns are located.
local TemplateTable = 
{
	[1] = {0, 0, 6, 3, 0},
	[2] = {3, 1, 0, 4, 0},
	[3] = {3, 1, 6, 0, 0},
	[4] = {3, 1, 0, 0, 0},
	[5] = {0, 0, 0, 3, 0},
	[6] = {3, 1, 6, 4, 0},
	[7] = {0, 0, 6, 3, 5}
--This reads as "Template Number 1 has a Mana Cost value on line 3, and a cooldown on line 6."
}

--Don't touch this table if you're editing tooltips, it's used for optimization and data storing.
--data table for tooltip correction
--format [spellid] = {powerLine, powerVal, powerType, cooldownLine, CD val, rangeLine, rangeVal, updateVal?, castLine, castVal}
local dataTable = {}



local function GetTipNum()
	TipNum = GameTooltip:NumLines()
end

local function GetID()
	_, _, TipID = GameTooltip:GetSpell()
end


local function RequestIDCheck(spellid)
	
	AIO.Handle("TooltipAIO", "HasSpellID", spellid)

end


function tTHandler.ReceiveIDCheck(player, check)
	spellCheck = check
end

function RequestSpellCost(spellid) 

	if(dataTable[spellid]) then 

		if(dataTable[spellid][8]) then 
			AIO.Handle("TooltipAIO", "CostGrabber", spellid)
			AIO.Handle("TooltipAIO", "CooldownGrabber", spellid)
			dataTable[spellid][8] = false
			--print("updating values")
			skipCheck = true
		else 
			--print("no need to updates values")
			skipCheck = false
		--locUpdateTooltips()
		end	
	else

		--print("Fresh spell detected. Need to update.")
		AIO.Handle("TooltipAIO", "CostGrabber", spellid)
		--AIO.Handle("TooltipAIO", "CooldownGrabber", spellid)
		local skipCheck = true
		local tmpTemplate = TemplateTable[TaggedSpells[spellid]]
		local insertFmt = {tmpTemplate[1], 0, tmpTemplate[2], tmpTemplate[3], 0, tmpTemplate[4], 0, true, tmpTemplate[5], 0}
		dataTable[spellid] = insertFmt
		--table.insert(dataTable[spellid], insertFmt)
		--print(dataTable[spellid][8])

		dataTable[spellid][8] = false
	end

end

function tTHandler.RefreshTable(player)

	for k,v in pairs(dataTable) do 
		dataTable[k][8] = true
	end
end

function tTHandler.ReceiveCostGrab(player, cost, powerType)
	--print(cost)

	modCost = cost
	dataTable[TipID][2] = modCost
	dataTable[TipID][3] = powerType
--print("ReceiveCostGrab Fired")
end

function tTHandler.ReceiveCDGrab(player, cooldown)
	--print(cooldown)
	modCooldown = (cooldown / 1000)
	dataTable[TipID][5] = modCooldown
	--print("ReceiveCDGrab Fired")	
end

function tTHandler.ReceiveRangeGrab(player, range)

	modRange = range
	dataTable[TipID][7] = modRange
end

function tTHandler.ReceiveCastTime(player, castTime)
	modCastTime = castTime
	dataTable[TipID][10] = modCastTime
end

local function EnumerateTooltipLines_helper(...)
	--this grabs all the lines from the original tooltip, and stores them.
	for x = 1, select("#", ...) do
		--print(x .. " Enumeratedtooltiplinevar")
		local region = select(x, ...)
		if region and region:GetObjectType() == "FontString" then
			local text = region:GetText() -- string or nil
			--print(x .. " was X, and the text is " .. text)
			--print(x)
			--print(text)
			tab[x] = text
		end
	end


end

function EnumerateTooltipLines(tooltip)
	EnumerateTooltipLines_helper(tooltip:GetRegions())
end

function tTHandler.UpdateTooltips()

	local powerString
	if(dataTable[TipID][3] == 0) then
	powerString = " Mana"
	elseif(dataTable[TipID][3] == 1) then
	powerString = " Rage"
	elseif(dataTable[TipID][3] == 2) then 
	powerString = " Focus"
	elseif(dataTable[TipID][3] == 3) then 
	powerString = " Energy"
	elseif(dataTable[TipID][3] > 8) then
	powerString = " Health"	
	end
	


	for x = 10, 35 do 

		if(x == (dataTable[TipID][1] + 9)) then
			if(dataTable[TipID][3] == 1) then 
				tab[x] = (dataTable[TipID][2] / 10) .. powerString
			else 
				tab[x] = dataTable[TipID][2] .. powerString
			end

		end

		if(x == (dataTable[TipID][4] + 9)) then
			tab[x] = dataTable[TipID][5] .. " sec cooldown"
		end

		if(x == dataTable[TipID][6] + 9) then
			tab[x] = dataTable[TipID][7] .. " yds"
		end

		if(x == dataTable[TipID][9] + 9) then 
			tab[x] = (dataTable[TipID][10] / 1000) .. " sec cast"
		end
	
	end


	
	local i = 10
	GameTooltip:ClearLines ()
	while i <= 35 do
		if(i <= 13) then
			GameTooltip:AddDoubleLine (tab[i], tab[i+1])
			i = i + 2

		elseif (tab[i]) then
			GameTooltip:AddLine (tab[i], 1, 1, 1, true)
			i = i + 1
			else
			i = i + 1
		end
	end
	GameTooltip:Show()
local o = 10
while o <= 35 do
	tab[o] = nil
	o = o + 1
end
end

function locUpdateTooltips() 

	local powerString
	if(dataTable[TipID][3] == 0) then
		powerString = " Mana"
	elseif(dataTable[TipID][3] == 1) then
		powerString = " Rage"
	end
	

	for x = 10, 35 do 

		if(x == (dataTable[TipID][1] + 9)) then
			if(dataTable[TipID][3] == 1) then 
				tab[x] = (dataTable[TipID][2] / 10) .. powerString
			else 
				tab[x] = dataTable[TipID][2] .. powerString
			end

		end

		if(x == (dataTable[TipID][4] + 9)) then
			tab[x] = dataTable[TipID][5] .. " sec cooldown"
		end

		if(x == dataTable[TipID][6] + 9) then
			tab[x] = dataTable[TipID][7] .. " yds"
		end
	
		if(x == dataTable[TipID][9] + 9) then 
			tab[x] = (dataTable[TipID][10] / 1000) .. " sec cast"
		end
	end

	local i = 10
	GameTooltip:ClearLines ()

	while i <= 35 do
		if(i <= 13) then
			GameTooltip:AddDoubleLine (tab[i], tab[i+1])
			i = i + 2

		elseif (tab[i]) then
			GameTooltip:AddLine (tab[i], 1, 1, 1, true)
			i = i + 1
			else
			i = i + 1
		end
	end
	GameTooltip:Show()

	local o = 10
	while o <= 35 do
		tab[o] = nil
		o = o + 1
	end

end

local function GetCorrection(spellID)
	--z var for ensuring ordered entries.

	tempNum = TaggedSpells[spellID]
	pTemplateTable = TemplateTable[tempNum]

end


local function ModifyTip ()
	if(GameTooltip:GetSpell ()) then
		GetID()
		if(TaggedSpells[TipID]) then 
			GetTipNum()
			GetCorrection(TipID)

			EnumerateTooltipLines(GameTooltip)
			RequestSpellCost(TipID)

			if((dataTable[TipID][8] == false) and (skipCheck == false)) then 
				locUpdateTooltips()
			end

		end
	end
end

GameTooltip:SetScript("OnShow", ModifyTip)

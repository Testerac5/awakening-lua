local AIO = AIO or require ("AIO")

if AIO.AddAddon() then
	return
end

local tTHandler = AIO.AddHandlers ("TooltipAIO", {})

local TipNum

local TipID

local spellCheck = false

--used to read tooltip
local tab = {}
--used to hold onto results pulled from correctionstable
local correctionMatches = {}


--format: {spellToCorrect, tooltipLine, tooltipContent, HasSpell}
--The below examples are testing filler, you can delete.
local correctionsTable = {
	
}

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

local function EnumerateTooltipLines_helper(...)
	--this grabs all the lines from the original tooltip, and stores them.
	for x = 1, select("#", ...) do
		local region = select(x, ...)
		if region and region:GetObjectType() == "FontString" then
			local text = region:GetText() -- string or nil
			tab[(x-9)] = text
		end
	end
	--this iterates through all the positive matches for a unique spellid entry.
	for y = 1, table.getn(correctionMatches) do 
		--this subloop ensures that all positive matches concatenate into one tooltip,
		--with latter matches on the same line overriding previous ones.
		for x = 1, 16 do 
			if(x == (correctionMatches[y][2] + 9)) then 
			tab[(x-9)] = correctionMatches[y][3]
			end
		end
	end	
end

function EnumerateTooltipLines(tooltip)
	EnumerateTooltipLines_helper(tooltip:GetRegions())
end

local function GetCorrection(spellID)
	--z var for ensuring ordered entries.
	local z = 1
	for y = 1, table.getn(correctionsTable) do
		if(correctionsTable[y][1] == spellID) then
			RequestIDCheck(correctionsTable[y][4])
			if(spellCheck) then 
				correctionMatches[z] = correctionsTable[y]
				z = z + 1
			else 
				z = z + 1
			end	
		end
	end
	z = 1
end

--optimization function, probably better ways to do this
local function PlayerHasSpell(spellID)
	for x = 1, table.getn(correctionsTable) do 
		if(correctionsTable[x][1] == spellID) then 
			return true
		else 
			return false
		end
	end
end

local function ModifyTip ()
	if(GameTooltip:GetSpell ()) then
		GetID()
		GetTipNum()
		if(PlayerHasSpell(TipID)) then 
			GetCorrection(TipID)
			EnumerateTooltipLines(GameTooltip)
			if(correctionMatches) then
				local i = 1
				GameTooltip:ClearLines ()
				while i <= TipNum * 2 do
					if(i <= 3) then
						GameTooltip:AddDoubleLine (tab[i], tab[i+1])
						i = i + 2
					elseif (tab[i]) then
						GameTooltip:AddLine (tab[i], 1, 1, 1, true)
						i = i + 1
						else
						i = i + 1
					end
				end
				--unsure if this is even needed
				for i,v in ipairs(correctionMatches) do
					correctionMatches[i] = nil
				end
			end
		end
	end
end



GameTooltip:SetScript("OnShow", ModifyTip)

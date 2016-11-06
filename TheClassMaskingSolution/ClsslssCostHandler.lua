

--[==[
	POWER_MANA                          = 0,
    POWER_RAGE                          = 1,
    POWER_FOCUS                         = 2,
    POWER_ENERGY                        = 3,
    POWER_HAPPINESS                     = 4,
    POWER_RUNE                          = 5,
    POWER_RUNIC_POWER                   = 6,
    MAX_POWERS                          = 7,      unused
    POWER_ALL                           = 127,    unused
    POWER_HEALTH                        = -2,     
use the above list to determine which power type should be reduced.
]==]--

local powType = 0
local spellCost = 0
local tempSpell = 0
local castCheck
local tempPlayer


--format: {spellid, powerType, powerCost, hasSpell}
local correctionsTable = 
{
	{5185, 0, 100, 133}
}
local function StopCastingNow(event, delay, pCall, pPlayer)
	pPlayer:InterruptSpell(1)
end


local function CostHandler(event, pPlayer, spell)
	local tempCache = {}
	for i,value in ipairs(correctionsTable) do 
		if(correctionsTable[i][1] == spell:GetEntry() and pPlayer:HasSpell(correctionsTable[i][4])) then 
			tempCache[1] = value
		end
	end
	if (not tempCache) then
	return
	end
	spellCost = tempCache[1][3]
	powType = tempCache[1][2]
	if(pPlayer:GetPower(powType) - (spellCost + spell:GetPowerCost()) <= 0) then
		tempSpell = spell
		tempPlayer = pPlayer
		pPlayer:RegisterEvent(StopCastingNow, 0, 1, tempPlayer)
		castCheck = false
	else
		castCheck = true
	end
	tempCache = nil
end

local function TakePowerPls(event, player, spell, skipCheck)
	if(castCheck) then 
		player:ModifyPower(powType, -spellCost)
		castCheck = false
	end
end

RegisterPlayerEvent (44, CostHandler)
RegisterPlayerEvent (5, TakePowerPls)

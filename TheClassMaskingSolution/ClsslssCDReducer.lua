
--local AIO = AIO or require("AIO")

--local MyHandlers = AIO.AddHandlers("AIOFiller", {})


--The below code is for filling the CD Reduction correction table.
--The format is {spellId, -MillisecondsToReduceBy, HasSpell/Talent}
--The Bloodrage (2687) entries are just testing filler to demonstrate the structure.
--Subsequent entries override previous ones, so add same-spell reductions in order of Ranks.
--(Improved Fireball Rank 1, Rank 2, etc.)
local CDCorrections = 
{
	{2687, -30000, 116},
	{2687, -50000, 133}
}

CDReduc = 0
spellToMod = 0


--The rest of the stuff below doesn't even really need to be touched, unless extended functionality
--is required.

local function FireCooldownMod(event, delay, pCall, player)
player:ModifySpellCooldown(spellToMod, CDReduc)
end

local function CooldownGetter(spellCastId, player)
	local tempCache = {}
	for i,value in ipairs(CDCorrections) do
		if(CDCorrections[i][1] == spellCastId and player:HasSpell(CDCorrections[i][3])) then 
			tempCache[1] = value
		end
	end
	print(tempCache[1][1])
	print(tempCache[1][2])
	if(player:HasSpell(tempCache[1][3])) then
		CDReduc = tempCache[1][2]
		spellToMod = tempCache[1][1]
	end
	tempCache[1] = nil
end

local function CooldownHandle(event, player, spell, skipCheck)

	local spellCheck = false

	for i,value in ipairs(CDCorrections) do
		if(CDCorrections[i][1] == spell:GetEntry()) then
			spellCheck = true
		end
	end

	if(spellCheck) then
		CooldownGetter(spell:GetEntry(), player)
		player:RegisterEvent(FireCooldownMod, 0, 1, player)
		return false
	end
   
end

--This lua code is all serverside, and the only thing communicated to the player is the ModifySpellCooldown command.

RegisterPlayerEvent(5, CooldownHandle)


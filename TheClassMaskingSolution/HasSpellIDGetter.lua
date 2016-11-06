-- the lua script for grabbing if the player has a certain spellid learned.

local AIO = AIO or require ("AIO")

local tTHandler = AIO.AddHandlers ("TooltipAIO", {})

function tTHandler.HasSpellID(player, spellid)
	local y = player:HasSpell(spellid)
	AIO.Handle(player, "TooltipAIO", "ReceiveIDCheck", y)
	
end
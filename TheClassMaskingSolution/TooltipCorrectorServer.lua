-- the lua script for grabbing if the player has a certain spellid learned.

local AIO = AIO or require ("AIO")

local tTHandler = AIO.AddHandlers ("TooltipAIO", {})

function tTHandler.HasSpellID(player, spellid)
	local y = player:HasSpell(spellid)
	AIO.Handle(player, "TooltipAIO", "ReceiveIDCheck", y)
	
end

function tTHandler.CostGrabber(player, spellid)
	local y = player:GetSpellCost(spellid)
	local x = player:GetSpellCooldown(spellid)
	local z = player:GetSpellRange(spellid)
	local w = player:GetSpellPowerType(spellid)
	local v = player:GetSpellCastTime(spellid)

	AIO.Handle(player, "TooltipAIO", "ReceiveCostGrab", y, w)
	AIO.Handle(player, "TooltipAIO", "ReceiveCDGrab", x)
	AIO.Handle(player, "TooltipAIO", "ReceiveRangeGrab", z)
	AIO.Handle(player, "TooltipAIO", "ReceiveCastTime", v)
	AIO.Handle(player, "TooltipAIO", "UpdateTooltips")
end

function tTHandler.SendRefresh(event, player, spellid)
	AIO.Handle(player, "TooltipAIO", "RefreshTable")
end


RegisterPlayerEvent(45, tTHandler.SendRefresh)


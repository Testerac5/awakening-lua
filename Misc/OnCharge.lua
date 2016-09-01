local charge = {100, 6178, 11578}
local spell = 818051 -- change to rage generating spell
local function OnCharge(event, player, spell, skipCheck)
	for y, chargeid in pairs(charge) do
		if (spell:GetEntry() == chargeid) then
			player:CastSpell(818051)
			player:SendBroadcastMessage("Spell was casted")
			end
		end
	end
RegisterPlayerEvent(5, OnCharge)
local function Potency(event, player, spell, skipCheck)
	if (spell:GetEntry() == 12536) and (player:HasSpell(31572) == true) then
		player:AddAura(57531, player)
		player:SendBroadcastMessage("test")
	end
end

RegisterPlayerEvent(5, Potency)
local function Potency(event, player, spell, skipCheck)
	if (spell:GetEntry() == 12536) and (player:HasSpell(31572) == true)
		player:AddAura(57531, self)
	end
end

RegisterPlayerEvent(5, Potency)
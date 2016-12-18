local function DivineDebuff(event, player, spell, skipCheck)
	if (spell:GetEntry() == 12536) and (player:HasSpell(31572) == true)
		player:AddAura(57531)
	end
end

RegisterPlayerEvent(5, DivineDebuff)
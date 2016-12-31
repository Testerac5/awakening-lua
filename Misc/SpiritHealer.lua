local function SpiritSelect(event, player, creature, sender, intid, code)
	-- teleport based on gossip option
	if (intid == 1) then
		local RQuery1 = WorldDBQuery("SELECT race, map, x, y, z, o FROM player_resurrect_locations WHERE race = " ..player:GetRace().. ";")
		if (RQuery1:GetInt32(0) ~= nil) then
			-- add rez sickness, destroy items equipped, resurrect player
			player:Teleport(RQuery1:GetInt32(1), RQuery1:GetInt32(2), RQuery1:GetInt32(3), RQuery1:GetInt32(4), RQuery1:GetInt32(5))
			player:ResurrectPlayer(50, true)
			player:DurabilityLossAll(100, false)
			player:AddAura(15007, player)
			else
			player:SendBroadcastMessage("An error has occurred within script:SpiritHealer.lua. Please report this to an administrator.")
		end
	end
end
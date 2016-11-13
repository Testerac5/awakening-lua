local function NPCBork(event, player, object)
	if player:HasTitle(25) then
		creature:AddVendorItem(125694, 29472, 0, 0, 0)
	end
end

RegisterPlayerGossipEvent(125694, 1, NPCBork)
local function SpookyItUp(eventId, delay, repeats, player)
	player:GetCreaturesInRange(100, 10475, 0, 0)
	for x=1,#mobs,1 do
		local x = mobs[x]:GetX()
		local y = mobs[x]:GetY()
		local z = mobs[x]:GetZ()
		local o = mobs[x]:GetO()
		if mobs[x]:IsDead() == false then
			mobs[x]:Kill(mobs[x])
		end
		mobs[x]:SpawnCreature(11547, x, y, z, o, 6, 60000)
	end
end

local function Spooky(event, player, item, target)
	local dummy = player:GetNearestCreature(100, 750018, 0, 0)
	local cx = dummy:GetX()
	local cy = dummy:GetY()
	local cz = dummy:GetZ()
	local co = dummy:GetO()
	player:SummonGameObject(177304, cx, cy, cz, co)
	local gambit = player:GetNearestGameobject(10, 177304)
	gambit:RemoveFromWorld(true)
	player:RegisterEvent(14000, SpookyItUp, 1)
	player:SendBroadcastMessage("gambit removed: " ..gambit.. ".")
end

RegisterItemEvent(17191, 2, Spooky)
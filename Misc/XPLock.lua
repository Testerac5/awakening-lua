local function Lock(event, player, oldLevel)
	-- on level up, does loop to check if quest has been completed by level (represented as y). if yes, halt code. if not, continue to add aura.
	local questID = {
-- {req. level, questid}
	{10, 899},
	{20, 4921},
	}
	for y=1,#questID,1 do
		if (player:GetQuestStatus(questID[y][2]) == 6) and (player:GetLevel() == questID[y][1]) then
			return true
		elseif (player:GetLevel() == questID[y][1]) then
			player:AddAura(818057, player)
			return false
		end
	end
end

RegisterPlayerEvent(13, Lock)

local function TimedCheck(event, player)
	-- a timer based on the player save interval that will remove the aura if character has completed quests in loop
	if (player:HasAura(818057) == false) then
		return false
	end
	local questID = {
-- {req. level, questid}
	{10, 899},
	{20, 4921},
	}
	for y=1,#questID,1 do
		if (player:GetQuestStatus(questID[y][2]) == 6) and (player:GetLevel() == questID[y][1]) then
			player:RemoveAura(818057)
			return true
		end
	end
end

RegisterPlayerEvent(25, TimedCheck)
local Gift_Text = "Your feats before the Azeroth will never be forgotten and we hope that this humble reward will help you to polish your great skills."
local Gift_Subject = "To the Greatest Hero Azroth Evern Known"
local function ScrollGift(event, player, oldLevel)
	if ((oldLevel+1)%10 == 0) then
		SendMail( Gift_Subject, Gift_Text, player:GetGUIDLow(), 0, 61, 0, 0, 0, 1101243, 1)
	end
end

RegisterPlayerEvent(13, ScrollGift)
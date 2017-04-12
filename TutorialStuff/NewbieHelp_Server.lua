local AIO = AIO or require("AIO")


local TutAIO = AIO.AddHandlers("TutAIO", {})

local function TutorialStuff_SendHelp(event, player, oldLevel)
local currtip = 1
local maxtips = 1

if (oldLevel == 1) then
currtip = 7
maxtips = 7
elseif (oldLevel == 4) then
currtip = 8
maxtips = 9
elseif (oldLevel == 9) then
currtip = 10
maxtips = 12
elseif (oldLevel == 19) then
currtip = 13
maxtips = 13
end

TutorialAio(AIO.Msg(), player,currtip,maxtips):Send(player)
end


RegisterPlayerEvent(13, TutorialStuff_SendHelp)

RegisterPlayerEvent(30, function(event,player)
	TutorialAio(AIO.Msg(), player,1,6):Send(player)
	end)

function TutorialAio(msg,player,currtip,maxtips)
	return msg:Add("TutAIO", "InitFrame", currtip,maxtips)
end
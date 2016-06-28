
local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end


local MyHandlers = AIO.AddHandlers("HungerBar", {})


Framework = CreateFrame("Frame", "first_frame", UIParent, nil)
local frame = Framework


frame:SetSize(100, 20)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("TOPLEFT", 100, -100)
frame:SetToplevel(false)
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
            tile = true
			})  
frame:SetScript("OnDragStart", frame.StartMoving)	
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)





AIO.SavePosition(frame)


local second_frame = CreateFrame("Frame", "Second_Frame", frame)
second_frame:SetSize(100,19)
second_frame:RegisterForDrag("LeftButton")
second_frame:SetPoint("LEFT")
second_frame:SetToplevel(true)
second_frame:SetClampedToScreen(true)
second_frame:SetMovable(false)
second_frame:EnableMouse(false)
second_frame:SetBackdrop({
            bgFile = "Interface/Tooltips/UI-Tooltip-Background",
            tile = true,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
			})  
second_frame:SetBackdropColor(1,0,.7,1)
local function frame2_Tooltip_OnEnter(self, motion)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("Hunger Bar\nEat food to raise it!")
            GameTooltip:Show()
       end
frame:SetScript("OnEnter", frame2_Tooltip_OnEnter)
local function frame2_Tooltip_OnLeave(self, motion)
            GameTooltip:Hide()
        end
frame:SetScript("OnLeave", frame2_Tooltip_OnLeave)



function MyHandlers.GetHungerPct(player,current_hunger)

	local level = UnitLevel("player")

	
	local max_hunger = (level * 5) + 100
	
	local rough_pct = ((current_hunger ) / max_hunger) * 100

	
	local percent =  rough_pct - (rough_pct % 1)
	
	if percent <= 0 then
	
		print("I am extremely hungry and have started taking damage")
	
	elseif percent < 25 then
	
		second_frame:SetBackdropColor(1,.35,0,1)
		print("I must eat soon or I will start taking damage")
	
	elseif percent < 65 then
	
		second_frame:SetBackdropColor(.9,.9,.3,1)
	
	end
	
	if percent > 65 then
		second_frame:SetBackdropColor(1,0,.7,1)
	end
	
	
	second_frame:SetSize(percent, 19)

end




function MyHandlers.ShowFrame(player)
    frame:Show()
	second_frame:Show()
	
end



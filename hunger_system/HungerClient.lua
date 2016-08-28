
local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end


local MyHandlers = AIO.AddHandlers("HungerBar", {})


Framework = CreateFrame("Frame", "first_frame", UIParent, nil)
local frame = Framework


frame:SetSize(142, 40)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("TOPLEFT", 100, -100)
frame:SetToplevel(false)
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetBackdrop({
            bgFile = "Interface\\AddOns\\AwAddons\\Textures\\misc\\WowUI_Horizontal_Frame",
            --tile = true
            })  
frame:SetScript("OnDragStart", frame.StartMoving)   
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)





AIO.SavePosition(frame)

local Food_Ico = frame:CreateTexture(nil, "ARTWORK")
        Food_Ico:SetWidth(26);               
        Food_Ico:SetHeight(26);
        Food_Ico:SetTexture("Interface\\AddOns\\AwAddons\\Textures\\misc\\Food")
        Food_Ico:SetPoint("LEFT", -15,0)

local Hunger_BackGround = frame:CreateTexture(nil, "BACKGROUND")
        Hunger_BackGround:SetWidth(105);               
        Hunger_BackGround:SetHeight(19);
        Hunger_BackGround:SetTexture("Interface/CHARACTERFRAME/UI-Party-Background")
        Hunger_BackGround:SetVertexColor(1,1,1,0.6)
        Hunger_BackGround:SetPoint("CENTER")


local second_frame = CreateFrame("Frame", "Second_Frame", frame)
second_frame:SetSize(105,19)
second_frame:RegisterForDrag("LeftButton")
second_frame:SetPoint("CENTER")
second_frame:SetToplevel(true)
second_frame:SetClampedToScreen(true)
second_frame:SetMovable(false)
second_frame:EnableMouse(false)
second_frame:SetFrameStrata("MEDIUM")
second_frame:SetBackdrop({
            bgFile = "Interface\\TargetingFrame\\UI-StatusBar",
            --tile = true,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
            })  
second_frame:SetBackdropColor(1,0,.7,0.8)
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
    
        print("|cffFFFF00I am extremely hungry, and I am beginning to starve.|r") -- edited
    
    elseif percent < 25 then
    
        second_frame:SetBackdropColor(1,.35,0,0.8)
        print("|cffFFFF00I must eat soon or I will start taking damage.|r") -- edited
    
    elseif percent < 65 then
    
        second_frame:SetBackdropColor(.9,.9,.3,0.8)
    
    end
    
    if percent > 65 then
        second_frame:SetBackdropColor(1,0,.7,0.8)
    end
	
	
	second_frame:SetSize(percent, 19)

end




function MyHandlers.ShowFrame(player)
    frame:Show()
	second_frame:Show()
	
end



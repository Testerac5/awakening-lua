
local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end


local MyHandlers = AIO.AddHandlers("PvP", {})


Framework = CreateFrame("Frame", "first_frame", UIParent, nil)
local FullLootFrame = Framework
FullLootFrame:SetSize(350, 500)
FullLootFrame:SetMovable(true)
FullLootFrame:EnableMouse(true)
FullLootFrame:RegisterForDrag("LeftButton")
FullLootFrame:SetPoint("BOTTOMRIGHT", -270, 60)
FullLootFrame:SetToplevel(true)
FullLootFrame:SetClampedToScreen(true)
FullLootFrame:SetBackdrop({
	bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
	edgeSize = 20,
	--tile = true,
	--tilesize = 256,
	insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
FullLootFrame:SetScript("OnDragStart", FullLootFrame.StartMoving)
FullLootFrame:SetScript("OnHide", FullLootFrame.StopMovingOrSizing)
FullLootFrame:SetScript("OnDragStop", FullLootFrame.StopMovingOrSizing)

FullLootFrame:Hide()

local FullLootFrame_TitleBar = CreateFrame("Frame", "FullLootFrame_TitleBar", FullLootFrame, nil)
FullLootFrame_TitleBar:SetSize(255, 25)
FullLootFrame_TitleBar:SetBackdrop({
	bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
	tile = true,
	edgeSize = 16,
	tileSize = 16,
	insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
FullLootFrame_TitleBar:SetPoint("TOP", 0, 9)
local FullLootFrame_TitleText = FullLootFrame_TitleBar:CreateFontString("FullLootFrame_TitleText")
FullLootFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
FullLootFrame_TitleText:SetSize(190, 5)
FullLootFrame_TitleText:SetPoint("CENTER", 0, 0)
local FullLootFrame_CloseButton = CreateFrame("Button", "FullLootFrame_CloseButton", FullLootFrame, "UIPanelCloseButton")
FullLootFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
FullLootFrame_CloseButton:EnableMouse(true)
FullLootFrame_CloseButton:SetSize(27, 27)



local FullLoot_Button1 = CreateFrame("Button", "FullLoot_Button1", FullLootFrame, nil)
local FullLoot_Button2 = CreateFrame("Button", "FullLoot_Button2", FullLootFrame, nil)
local FullLoot_Button3 = CreateFrame("Button", "FullLoot_Button3", FullLootFrame, nil)
local FullLoot_Button4 = CreateFrame("Button", "FullLoot_Button4", FullLootFrame, nil)
local FullLoot_Button5 = CreateFrame("Button", "FullLoot_Button5", FullLootFrame, nil)
local FullLoot_Button6 = CreateFrame("Button", "FullLoot_Button6", FullLootFrame, nil)
local FullLoot_Button7 = CreateFrame("Button", "FullLoot_Button7", FullLootFrame, nil)
local FullLoot_Button8 = CreateFrame("Button", "FullLoot_Button8", FullLootFrame, nil)
local FullLoot_Button9 = CreateFrame("Button", "FullLoot_Button9", FullLootFrame, nil)
local FullLoot_Button10 = CreateFrame("Button", "FullLoot_Button10", FullLootFrame, nil)
local FullLoot_Button11 = CreateFrame("Button", "FullLoot_Button11", FullLootFrame, nil)
local FullLoot_Button12 = CreateFrame("Button", "FullLoot_Button12", FullLootFrame, nil)
local FullLoot_Button13 = CreateFrame("Button", "FullLoot_Button13", FullLootFrame, nil)
local FullLoot_Button14 = CreateFrame("Button", "FullLoot_Button14", FullLootFrame, nil)
local FullLoot_Button15 = CreateFrame("Button", "FullLoot_Button15", FullLootFrame, nil)
local FullLoot_Button16 = CreateFrame("Button", "FullLoot_Button16", FullLootFrame, nil)
local FullLoot_Button17 = CreateFrame("Button", "FullLoot_Button17", FullLootFrame, nil)
local FullLoot_Button18 = CreateFrame("Button", "FullLoot_Button18", FullLootFrame, nil)
local FullLoot_Button19 = CreateFrame("Button", "FullLoot_Button19", FullLootFrame, nil)
local FullLoot_Button20 = CreateFrame("Button", "FullLoot_Button20", FullLootFrame, nil)
local FullLoot_Button21 = CreateFrame("Button", "FullLoot_Button21", FullLootFrame, nil)
local FullLoot_Button22 = CreateFrame("Button", "FullLoot_Button22", FullLootFrame, nil)
local FullLoot_Button23 = CreateFrame("Button", "FullLoot_Button23", FullLootFrame, nil)
local FullLoot_Button24 = CreateFrame("Button", "FullLoot_Button24", FullLootFrame, nil)
local FullLoot_Button25 = CreateFrame("Button", "FullLoot_Button25", FullLootFrame, nil)

local FullLoot_Text1 = FullLoot_Button1:CreateFontString("FullLoot_Text1")
local FullLoot_Text2 = FullLoot_Button2:CreateFontString("FullLoot_Text2")
local FullLoot_Text3 = FullLoot_Button3:CreateFontString("FullLoot_Text3")
local FullLoot_Text4 = FullLoot_Button4:CreateFontString("FullLoot_Text4")
local FullLoot_Text5 = FullLoot_Button5:CreateFontString("FullLoot_Text5")
local FullLoot_Text6 = FullLoot_Button6:CreateFontString("FullLoot_Text6")
local FullLoot_Text7 = FullLoot_Button7:CreateFontString("FullLoot_Text7")
local FullLoot_Text8 = FullLoot_Button8:CreateFontString("FullLoot_Text8")
local FullLoot_Text9 = FullLoot_Button9:CreateFontString("FullLoot_Text9")
local FullLoot_Text10 = FullLoot_Button10:CreateFontString("FullLoot_Text10")
local FullLoot_Text11 = FullLoot_Button11:CreateFontString("FullLoot_Text11")
local FullLoot_Text12 = FullLoot_Button12:CreateFontString("FullLoot_Text12")
local FullLoot_Text13 = FullLoot_Button13:CreateFontString("FullLoot_Text13")
local FullLoot_Text14 = FullLoot_Button14:CreateFontString("FullLoot_Text14")
local FullLoot_Text15 = FullLoot_Button15:CreateFontString("FullLoot_Text15")
local FullLoot_Text16 = FullLoot_Button16:CreateFontString("FullLoot_Text16")
local FullLoot_Text17 = FullLoot_Button17:CreateFontString("FullLoot_Text17")
local FullLoot_Text18 = FullLoot_Button18:CreateFontString("FullLoot_Text18")
local FullLoot_Text19 = FullLoot_Button19:CreateFontString("FullLoot_Text19")
local FullLoot_Text20 = FullLoot_Button20:CreateFontString("FullLoot_Text20")
local FullLoot_Text21 = FullLoot_Button21:CreateFontString("FullLoot_Text21")
local FullLoot_Text22 = FullLoot_Button22:CreateFontString("FullLoot_Text22")
local FullLoot_Text23 = FullLoot_Button23:CreateFontString("FullLoot_Text23")
local FullLoot_Text24 = FullLoot_Button24:CreateFontString("FullLoot_Text24")
local FullLoot_Text25 = FullLoot_Button25:CreateFontString("FullLoot_Text25")

local FullLoot_ButtonTable = {FullLoot_Button1, FullLoot_Button2, FullLoot_Button3, FullLoot_Button4, FullLoot_Button5, 
FullLoot_Button6, FullLoot_Button7, FullLoot_Button8, FullLoot_Button9, FullLoot_Button10, FullLoot_Button11, FullLoot_Button12, 
FullLoot_Button13, FullLoot_Button14, FullLoot_Button15, FullLoot_Button16, FullLoot_Button17, FullLoot_Button18, FullLoot_Button19, 
FullLoot_Button20, FullLoot_Button21, FullLoot_Button22, FullLoot_Button23, FullLoot_Button24, FullLoot_Button25}

local FullLoot_TextTable = {FullLoot_Text1, FullLoot_Text2, FullLoot_Text3, FullLoot_Text4, FullLoot_Text5, 
FullLoot_Text6, FullLoot_Text7, FullLoot_Text8, FullLoot_Text9, FullLoot_Text10, FullLoot_Text11, FullLoot_Text12, 
FullLoot_Text13, FullLoot_Text14, FullLoot_Text15, FullLoot_Text16, FullLoot_Text17, FullLoot_Text18, FullLoot_Text19, 
FullLoot_Text20, FullLoot_Text21, FullLoot_Text22, FullLoot_Text23, FullLoot_Text24, FullLoot_Text25}


function MyHandlers.ReceiveItems(player,itemNumber, itemList, objectid)
	itemHoldList = {}
	playerKilledName = nil
	
	objectPass = objectid
	
	nullItems = 25 - itemNumber
	
	if playerKilledName ~= nil then
	
		FullLootFrame_TitleText:SetText("|cffFFC125"..playerKilledName.."'s Belongings|r")
		
	else
	
		FullLootFrame_TitleText:SetText("|cffFFC125Unclaimed Belongings|r")
	
	end
	
	repeat
	
		local FullLoot_Button_null = FullLoot_ButtonTable[itemNumber + nullItems]
		local FullLoot_Text_null = FullLoot_TextTable[itemNumber + nullItems]
		
		FullLoot_Button_null:Hide()
		FullLoot_Text_null:Hide()
		
		nullItems = nullItems - 1
	
	until(nullItems <= 0)

	if itemNumber > 0 then
	
		if itemList[itemNumber][1] ~= nil and itemList[itemNumber][2] ~= nil and itemList[itemNumber][3] ~= nil then

			repeat
			local FullLoot_Button = FullLoot_ButtonTable[itemNumber]
			local FullLoot_Text = FullLoot_TextTable[itemNumber]
			
			FullLoot_Button:SetSize(200, 13)
			FullLoot_Button:SetPoint("TOPLEFT", 25, (-10-(itemNumber*15)))
			FullLoot_Button:EnableMouse(true)
			FullLoot_Button:SetHighlightTexture("Interface/Buttons/UI-Listbox-Highlight")
			FullLoot_Button:SetPushedTexture("Interface/Buttons/CheckButtonHilight") 
			item_idd = itemList[itemNumber][2]
			item_name = itemList[itemNumber][1]
			item_stuff = itemList[itemNumber][3]
			table.insert (itemHoldList, {FullLoot_Button, item_idd, item_name, item_stuff})
			

			function FullLoot_Button_Tooltip_OnEnter(self, motion)
				local item_rec = "Error, no item found"
				
				for i, v in ipairs(itemHoldList) do
					if v[1] == self then
						item_rec = v[2]
						break
					end
				end
			
				GameTooltip:SetOwner(self,"ANCHOR_RIGHT") 
				GameTooltip:SetHyperlink("item:"..item_rec..":0:0:0:0:0:0:0") 
				GameTooltip:Show()
			end
			FullLoot_Button:SetScript("OnEnter", FullLoot_Button_Tooltip_OnEnter)
			function FullLoot_Button_Tooltip_OnLeave(self, motion)
				GameTooltip:Hide()
			end
			FullLoot_Button:SetScript("OnLeave", FullLoot_Button_Tooltip_OnLeave)
			FullLoot_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
			FullLoot_Text:SetSize(200, 5)
			FullLoot_Text:SetPoint("CENTER", 0, 0)
			FullLoot_Text:SetText(""..itemList[itemNumber][1].." x"..itemList[itemNumber][3])
			FullLoot_Text:SetJustifyH("LEFT")
			

			function ClickItem(self)
				local item_rec = "Error, no item found"
				local item_link = 0
				local item_stuffy = 0
				local bag1, _ = GetContainerNumFreeSlots(1)
				local bag2, _ = GetContainerNumFreeSlots(2)
				local bag3, _ = GetContainerNumFreeSlots(3)
				local bag4, _ = GetContainerNumFreeSlots(4)
				local bag5, _ = GetContainerNumFreeSlots(5)
				local slots_open = bag1+bag2+bag3+bag4+bag5
				bagslot_free = true
				if slots_open == 0 then
					bagslot_free = false
				end
				
				
				
				if bagslot_free == true then
					
					for i, v in ipairs(itemHoldList) do
						if v[1] == self then
							item_rec = v[2]
							item_link = v[3]
							item_stuffy = v[4]
							break
						end
					end
					FullLoot_Button:Hide()
					FullLoot_Text:SetText("|cff9d9d9dLooted Item|r")
					FullLoot_Button:Disable()
					AIO.Handle("PvP", "AddPlayerItem", item_rec, item_stuffy, objectPass)
				else
				
					print("Clear a spot in your bags!")
					
				end
			end
			FullLoot_Button:SetScript("OnMouseUp", ClickItem)
			
			FullLoot_Button:Show()
			FullLoot_Text:Show()
			
			
			itemNumber = itemNumber - 1
			until(itemNumber <= 0)
			
		else
		
			local FullLoot_Button_null = FullLoot_ButtonTable[itemNumber]
			local FullLoot_Text_null = FullLoot_TextTable[itemNumber]
			
			FullLoot_Button_null:Hide()
			FullLoot_Text_null:Hide()
			
			itemNumber = itemNumber - 1
		
		end
		
	end
	
	FullLootFrame:Show()
end
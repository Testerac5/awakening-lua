local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end


local MyHandlers = AIO.AddHandlers("sideBar", {})



Framework_Base = CreateFrame("Frame", "sideBar", UIParent, nil)
local sideBar = Framework_Base
        sideBar:SetSize(42, 106)
        sideBar:SetMovable(true)
        sideBar:EnableMouse(true)
        sideBar:RegisterForDrag("LeftButton")
        sideBar:SetPoint("BOTTOMLEFT", 0, 275)
        sideBar:SetClampedToScreen(true)
        sideBar:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
            tile = true,
			edgeSize = 10,
			insets = { left = 1, right = 1, top = 1, bottom = 1 }
        }) 
		
	sideBar:SetScript("OnDragStart", sideBar.StartMoving)
	sideBar:SetScript("OnHide", sideBar.StopMovingOrSizing)
	sideBar:SetScript("OnDragStop", sideBar.StopMovingOrSizing)
	
	AIO.SavePosition(sideBar)
	
	sideBar:Show()
	
	
	--[[TRAINING FRAME]]--
    local TrainingFrame = CreateFrame("Frame", "TrainingFrame", UIParent, nil)
        TrainingFrame:SetSize(500, 300)
        TrainingFrame:SetMovable(true)
        TrainingFrame:EnableMouse(true)
        TrainingFrame:RegisterForDrag("LeftButton")
        TrainingFrame:SetPoint("CENTER")
        TrainingFrame:SetClampedToScreen(true)
        TrainingFrame:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
            edgeSize = 20,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        TrainingFrame:Hide()
		
		TrainingFrame:SetScript("OnDragStart", TrainingFrame.StartMoving)
		TrainingFrame:SetScript("OnHide", TrainingFrame.StopMovingOrSizing)
		TrainingFrame:SetScript("OnDragStop", TrainingFrame.StopMovingOrSizing)
		
		AIO.SavePosition(TrainingFrame)
		
		
	--[[Skill Frame]]
	local StatFrame = CreateFrame("Frame", "StatFrame", UIParent, nil)
        StatFrame:SetSize(200, 300)
        StatFrame:SetMovable(true)
        StatFrame:EnableMouse(true)
        StatFrame:RegisterForDrag("LeftButton")
        StatFrame:SetPoint("CENTER")
        StatFrame:SetClampedToScreen(true)
        StatFrame:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            edgeSize = 20,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        StatFrame:Hide()
		
		StatFrame:SetScript("OnDragStart", StatFrame.StartMoving)
		StatFrame:SetScript("OnHide", StatFrame.StopMovingOrSizing)
		StatFrame:SetScript("OnDragStop", StatFrame.StopMovingOrSizing)
		
		AIO.SavePosition(StatFrame)
		
		
	--[[Reset Frame]]
	local ResetFrame = CreateFrame("Frame", "ResetFrame", UIParent, nil)
		ResetFrame:SetSize(300,200)
		ResetFrame:SetMovable(true)
		ResetFrame:EnableMouse(true)
		ResetFrame:SetPoint("CENTER")
		ResetFrame:SetClampedToScreen(true)
		ResetFrame:SetBackdrop({
			bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			edgeSize = 20,
			insets = { left = 5, right = 5, top = 5, bottom = 5}
		})
		ResetFrame:Hide()
		
		ResetFrame:SetScript("OnDragStart", ResetFrame.StartMoving)
		ResetFrame:SetScript("OnHide", ResetFrame.StopMovingOrSizing)
		ResetFrame:SetScript("OnDragStop", ResetFrame.StopMovingOrSizing)
		
		AIO.SavePosition(ResetFrame)
		
		
	-- training button
    local TrainingButton = CreateFrame("Button", "TrainingButton", sideBar)
        TrainingButton:SetSize(32, 32)
        TrainingButton:SetPoint("CENTER", 0, 33)
        TrainingButton:EnableMouse(true)
        TrainingButton:SetNormalTexture("Interface/ICONS/INV_Misc_Book_11")
        TrainingButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
        TrainingButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		local function Training_button_pushed(self)
			TrainingFrame:Show() StatFrame:Hide() ResetFrame:Hide()
		end
		
        TrainingButton:SetScript("OnMouseUp", Training_button_pushed)
		
		local function TrainingButton_Tooltip_OnEnter(self, motion)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("|cffFFFFFFCharacter Advancement|r\nLearn new skills, or allocate skill points\nto improve existing ones.")
            GameTooltip:Show()
        end
		TrainingButton:SetScript("OnEnter", TrainingButton_Tooltip_OnEnter)
		local function TrainingButton_Tooltip_OnLeave(self, motion)
			GameTooltip:Hide()
		end
        TrainingButton:SetScript("OnLeave", TrainingButton_Tooltip_OnLeave)
		
		
	-- stat allocation button
    local StatAllocationButton = CreateFrame("Button", StatAllocationButton, sideBar)
        StatAllocationButton:SetSize(32, 32)
        StatAllocationButton:SetPoint("CENTER", 0, 0)
        StatAllocationButton:EnableMouse(true)
        StatAllocationButton:SetNormalTexture("Interface/ICONS/Ability_Warrior_StrengthOfArms")
        StatAllocationButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
        StatAllocationButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		local function StatAllocation_button_pushed(self)
			StatFrame:Show() TrainingFrame:Hide() ResetFrame:Hide()
			AIO.Handle("sideBar", "ReceivePlayerStats")
		end
        StatAllocationButton:SetScript("OnMouseUp",StatAllocation_button_pushed)
		local function StatAllocationButton_Tooltip_OnEnter(self, motion)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("|cffFFFFFFStat Allocation|r\nManage allocation of your attribute\npoints.")
            GameTooltip:Show()
		end
        StatAllocationButton:SetScript("OnEnter", StatAllocationButton_Tooltip_OnEnter)
		local function StatAllocationButton_Tooltip_OnLeave(self, motion)
			GameTooltip:Hide()
		end

        StatAllocationButton:SetScript("OnLeave", StatAllocationButton_Tooltip_OnLeave)
		
		
	-- ResetGui button
    local ResetButton = CreateFrame("Button", "ResetButton", sideBar)
        ResetButton:SetSize(32, 32)
        ResetButton:SetPoint("CENTER", 0, -33)
        ResetButton:EnableMouse(true)
        ResetButton:SetNormalTexture("Interface/ICONS/Achievement_Dungeon_PlagueWing")
        ResetButton:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
        ResetButton:SetPushedTexture("Interface/Buttons/CheckButtonHilight")
		local function ResetButton_button_pushed(self)
			ResetFrame:Show() TrainingFrame:Hide() StatFrame:Hide()
		end
		ResetButton:SetScript("OnMouseUp", ResetButton_button_pushed)
		local function ResetButton_Tooltip_OnEnter(self, motion)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText("|cffFFFFFFReset Spells/Talents|r\nUse your tokens to refund your\nSpells or Talents.")
			GameTooltip:Show()
		end
		ResetButton:SetScript("OnEnter", ResetButton_Tooltip_OnEnter)
		local function ResetButton_Tooltip_OnLeave(self)
            GameTooltip:Hide()
		end
		ResetButton:SetScript("OnLeave", ResetButton_Tooltip_OnLeave)
		
		
	-- ================================ SPECIFIC UI SECTIONS ==============================================
	
	--[[ StatFrame UI ]]
	
	local StatFrame_CloseButton = CreateFrame("Button", "StatFrame_CloseButton", StatFrame, "UIPanelCloseButton")
        StatFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
        StatFrame_CloseButton:EnableMouse(true)
        StatFrame_CloseButton:SetSize(27, 27)
       
    local StatFrame_TitleBar = CreateFrame("Frame", "StatFrame_TitleBar", StatFrame, nil)
        StatFrame_TitleBar:SetSize(135, 25)
        StatFrame_TitleBar:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
        StatFrame_TitleBar:SetPoint("TOP", 0, 9)
        local StatFrame_TitleText = StatFrame_TitleBar:CreateFontString("StatFrame_TitleText")
        StatFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
        StatFrame_TitleText:SetSize(190, 5)
        StatFrame_TitleText:SetPoint("CENTER", 0, 0)
        StatFrame_TitleText:SetText("|cffFFC125Stat Allocation|r")
       
    local StatFrame_Panel = CreateFrame("Frame", "StatFrame_Panel", StatFrame, nil)
        StatFrame_Panel:SetSize(179, 110)
        StatFrame_Panel:SetPoint("LEFT", 10, 69.5)
        StatFrame_Panel:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		
	local StatFrame_PointsPanel = CreateFrame("Frame", "StatFrame_PointsPanel", StatFrame, nil)
        StatFrame_PointsPanel:SetSize(170, 25)
        StatFrame_PointsPanel:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		StatFrame_PointsPanel:SetPoint("LEFT", 14, 6)
		
		
	-- Stat Names
        local StatNames = CreateFrame("Button", "StatNames", StatFrame, nil)
        StatNames:SetSize(60, 100)
        StatNames:SetPoint("TOPLEFT", 15, -37.5)
        local Strength_Text = StatNames:CreateFontString("Strength_Text")
        Strength_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Strength_Text:SetSize(137, 5)
        Strength_Text:SetPoint("TOP", 0, 0)
        Strength_Text:SetText("Strength")
        local Stamina_Text = StatNames:CreateFontString("Stamina_Text")
        Stamina_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stamina_Text:SetSize(137, 5)
        Stamina_Text:SetPoint("TOP", -1, -20)
        Stamina_Text:SetText("Stamina")
        local Agility_Text = StatNames:CreateFontString("Agility_Text")
        Agility_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Agility_Text:SetSize(137, 5)
        Agility_Text:SetPoint("TOP", -7, -40)
        Agility_Text:SetText("Agility")
        local Intellect_Text = StatNames:CreateFontString("Intellect_Text")
        Intellect_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Intellect_Text:SetSize(137, 5)
        Intellect_Text:SetPoint("TOP", -2.2, -60)
        Intellect_Text:SetText("Intellect")
        local Spirit_Text = StatNames:CreateFontString("Spirit_Text")
        Spirit_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Spirit_Text:SetSize(137, 5)
        Spirit_Text:SetPoint("TOP", -10.5, -80)
        Spirit_Text:SetText("Spirit")
        local Stat_Text = StatNames:CreateFontString("Stat_Text")
        Stat_Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stat_Text:SetSize(137, 5)
        Stat_Text:SetPoint("BOTTOMLEFT", -4, -8.5)
        Stat_Text:SetText("Available Stat Points:")
       
        --FontStrings for stat values
        local Str_Value = StatNames:CreateFontString("Str_Value")
        Str_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Str_Value:SetSize(137, 5)
        Str_Value:SetPoint("TOP", 104.8, 0)
        local Sta_Value = StatNames:CreateFontString("Sta_Value")
        Sta_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Sta_Value:SetSize(137, 5)
        Sta_Value:SetPoint("TOP", 104.8, -20)
        local Agi_Value = StatNames:CreateFontString("Agi_Value")
        Agi_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Agi_Value:SetSize(137, 5)
        Agi_Value:SetPoint("TOP", 104.8, -40)
        local Inte_Value = StatNames:CreateFontString("Inte_Value")
        Inte_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Inte_Value:SetSize(137, 5)
        Inte_Value:SetPoint("TOP", 104.8, -60)
        local Spi_Value = StatNames:CreateFontString("Spi_Value")
        Spi_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Spi_Value:SetSize(137, 5)
        Spi_Value:SetPoint("TOP", 104.8, -80)
		
		local Stat_Value = StatNames:CreateFontString("Stat_Value")
        Stat_Value:SetFont("Fonts\\FRIZQT__.TTF", 11)
        Stat_Value:SetSize(50, 5)
        Stat_Value:SetPoint("BOTTOMRIGHT", 115, -8.5)
		
		
	function MyHandlers.GetStatValues(player, stats)
	
		Str_Value:SetText(stats[1])
        Sta_Value:SetText(stats[2])
        Agi_Value:SetText(stats[3])
        Inte_Value:SetText(stats[4])
        Spi_Value:SetText(stats[5])
		Stat_Value:SetText(stats[6])
		
	end
	
	function Increase_stats(self)
	
		local stat = nil
	
		if self == Inc_Str then
		
			stat = 1
			
		elseif self == Inc_Sta then
		
			stat = 2
			
		elseif self == Inc_Agi then
		
			stat = 3
			
		elseif self == Inc_Inte then
		
			stat = 4
			
		elseif self == Inc_Spi then
		
			stat = 5
		end
			
		AIO.Handle("sideBar", "AddStats", stat)

	
	end
	
	function Reduce_stats(self)
	
		local stat = nil
	
		if self == Dec_Str then
		
			stat = 1
			
		elseif self == Dec_Sta then
		
			stat = 2
			
		elseif self == Dec_Agi then
		
			stat = 3
			
		elseif self == Dec_Inte then
		
			stat = 4
			
		elseif self == Dec_Spi then
		
			stat = 5
			
		end	
		AIO.Handle("sideBar", "ReduceStats", stat)

	
	end
	
	
	Inc_Str = CreateFrame("Button", "Inc_Str", StatFrame, nil)
        Inc_Str:SetSize(20, 20)
        Inc_Str:SetPoint("TOPRIGHT", -20, -30)
        Inc_Str:EnableMouse(true)
        Inc_Str:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Str:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Str:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Str:SetScript("OnMouseUp", Increase_stats)
       
    Dec_Str = CreateFrame("Button", "Dec_Str", StatFrame, nil)
        Dec_Str:SetSize(20, 20)
        Dec_Str:SetPoint("TOPRIGHT", -60, -30)
        Dec_Str:EnableMouse(true)
        Dec_Str:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Str:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Str:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Str:SetScript("OnMouseUp", Reduce_stats)
       
    Inc_Sta = CreateFrame("Button", "Inc_Sta", StatFrame, nil)
        Inc_Sta:SetSize(20, 20)
        Inc_Sta:SetPoint("TOPRIGHT", -20, -50)
        Inc_Sta:EnableMouse(true)
        Inc_Sta:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Sta:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Sta:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Sta:SetScript("OnMouseUp", Increase_stats)
       
    Dec_Sta = CreateFrame("Button", "Dec_Sta", StatFrame, nil)
        Dec_Sta:SetSize(20, 20)
        Dec_Sta:SetPoint("TOPRIGHT", -60, -50)
        Dec_Sta:EnableMouse(true)
        Dec_Sta:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Sta:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Sta:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Sta:SetScript("OnMouseUp", Reduce_stats)
       
    Inc_Agi = CreateFrame("Button", "Inc_Agi", StatFrame, nil)
        Inc_Agi:SetSize(20, 20)
        Inc_Agi:SetPoint("TOPRIGHT", -20, -70)
        Inc_Agi:EnableMouse(true)
        Inc_Agi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Agi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Agi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Agi:SetScript("OnMouseUp", Increase_stats)
       
    Dec_Agi = CreateFrame("Button", "Dec_Agi", StatFrame, nil)
        Dec_Agi:SetSize(20, 20)
        Dec_Agi:SetPoint("TOPRIGHT", -60, -70)
        Dec_Agi:EnableMouse(true)
        Dec_Agi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Agi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Agi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Agi:SetScript("OnMouseUp", Reduce_stats)
       
    Inc_Inte = CreateFrame("Button", "Inc_Inte", StatFrame, nil)
        Inc_Inte:SetSize(20, 20)
        Inc_Inte:SetPoint("TOPRIGHT", -20, -90)
        Inc_Inte:EnableMouse(true)
        Inc_Inte:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Inte:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Inte:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Inte:SetScript("OnMouseUp", Increase_stats)
       
    Dec_Inte = CreateFrame("Button", "Dec_Inte", StatFrame, nil)
        Dec_Inte:SetSize(20, 20)
        Dec_Inte:SetPoint("TOPRIGHT", -60, -90)
        Dec_Inte:EnableMouse(true)
        Dec_Inte:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Inte:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Inte:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Inte:SetScript("OnMouseUp", Reduce_stats)
       
    Inc_Spi = CreateFrame("Button", "Inc_Spi", StatFrame, nil)
        Inc_Spi:SetSize(20, 20)
        Inc_Spi:SetPoint("TOPRIGHT", -20, -110)
        Inc_Spi:EnableMouse(true)
        Inc_Spi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Up")
        Inc_Spi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Inc_Spi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-NextPage-Down")
        Inc_Spi:SetScript("OnMouseUp", Increase_stats)
       
    Dec_Spi = CreateFrame("Button", "Dec_Spi", StatFrame, nil)
        Dec_Spi:SetSize(20, 20)
        Dec_Spi:SetPoint("TOPRIGHT", -60, -110)
        Dec_Spi:EnableMouse(true)
        Dec_Spi:SetNormalTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Up")
        Dec_Spi:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
        Dec_Spi:SetPushedTexture("Interface/BUTTONS/UI-SpellbookIcon-PrevPage-Down")
        Dec_Spi:SetScript("OnMouseUp", Reduce_stats)
		
		
	--[[ Reset UI ]]
	
	
	function Reset_spells_button(self)
	
		AIO.Handle("sideBar", "ResetSpells")
	
	end
	
	function Reset_talents_button(self)
	
		AIO.Handle("sideBar", "ResetTalents")
	
	end
	
	
	local ResetFrame_CloseButton = CreateFrame("Button", "ResetFrame_CloseButton", ResetFrame, "UIPanelCloseButton")
		ResetFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
		ResetFrame_CloseButton:EnableMouse(true)
		ResetFrame_CloseButton:SetSize(27, 27)
		
	local ResetFrame_TitleBar = CreateFrame("Frame", "ResetFrame_TitleBar", ResetFrame, nil)
        ResetFrame_TitleBar:SetSize(135, 25)
        ResetFrame_TitleBar:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		ResetFrame_TitleBar:SetPoint("TOP", 0, 9)
		local ResetFrame_TitleText = ResetFrame_TitleBar:CreateFontString("ResetFrame_TitleText")
        ResetFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
        ResetFrame_TitleText:SetSize(225, 5)
        ResetFrame_TitleText:SetPoint("CENTER", 0, 0)
        ResetFrame_TitleText:SetText("|cffFFC125Reset Spells/Talents|r")
		
		
	local Reset_Spells = CreateFrame("Button", "Reset_Spells", ResetFrame, nil)
        Reset_Spells:SetSize(100, 50)
        Reset_Spells:SetPoint("CENTER", -60, -20)
        Reset_Spells:EnableMouse(true)
		local texture_spell = Reset_Spells:CreateTexture("Spell_Texture")
		texture_spell:SetAllPoints(Reset_Spells)
		texture_spell:SetTexture(0.5, 1, 1, 0.5)
        Reset_Spells:SetNormalTexture(texture_spell)
		local font_spell = Reset_Spells:CreateFontString("Spell_Font")
		font_spell:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_spell:SetShadowOffset(1, -1)
		Reset_Spells:SetFontString(font_spell)
		Reset_Spells:SetText("Spells Reset")
        Reset_Spells:SetScript("OnMouseUp", Reset_spells_button)
		
	local Reset_Talents = CreateFrame("Button", "Reset_Talents", ResetFrame, nil)
        Reset_Talents:SetSize(100, 50)
        Reset_Talents:SetPoint("CENTER", 60, -20)
        Reset_Talents:EnableMouse(true)
		local texture_talent = Reset_Talents:CreateTexture("Talent_Texture")
		texture_talent:SetAllPoints(Reset_Talents)
		texture_talent:SetTexture(0.5, 1, 1, 0.5)
        Reset_Talents:SetNormalTexture(texture_talent)
		local font_talent = Reset_Talents:CreateFontString("Talent_Font")
		font_talent:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_talent:SetShadowOffset(1, -1)
		Reset_Talents:SetFontString(font_talent)
		Reset_Talents:SetText("Talents Reset")
        Reset_Talents:SetScript("OnMouseUp", Reset_talents_button)
		
		
		
	--[[ Character Advancement UI ]]
	local TrainingFrame_CloseButton = CreateFrame("Button", "TrainingFrame_CloseButton", TrainingFrame, "UIPanelCloseButton")
		TrainingFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
		TrainingFrame_CloseButton:EnableMouse(true)
		TrainingFrame_CloseButton:SetSize(27, 27)
	
	
	
	
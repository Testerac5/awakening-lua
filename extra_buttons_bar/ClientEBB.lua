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
        TrainingFrame:SetSize(900, 890)
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
	spec_displaying = "ALL"
	frame_displaying = "BASIC"
	function display_stuff(self)
	
		local all_buttons = {BalanceDruid, FeralDruid, RestorationDruid, BeastMasteryHunter, MarksmanshipHunter, SurvivalHunter,
		ArcaneMage, FireMage, FrostMage, HolyPaladin, ProtectionPaladin, RetributionPaladin,
		DisciplinePriest, HolyPriest, ShadowPriest, AssassinationRogue, CombatRogue, SubtletyRogue,
		ElementalShaman, EnhancementShaman, RestorationShaman, AfflictionWarlock, DemonologyWarlock, DestructionWarlock,
		ArmsWarrior, FuryWarrior, ProtectionWarrior, GeneralStuff}
		
		local all_textures = {texture_BalanceDruid, texture_FeralDruid, texture_RestorationDruid, texture_BeastMasteryHunter, texture_MarksmanshipHunter, texture_SurvivalHunter,
		texture_ArcaneMage,texture_FireMage,texture_FrostMage,texture_HolyPaladin, texture_ProtectionPaladin, texture_RetributionPaladin,
		texture_DisciplinePriest, texture_HolyPriest, texture_ShadowPriest, texture_AssassinationRogue, texture_CombatRogue, texture_SubtletyRogue,
		texture_ElementalShaman, texture_EnhancementShaman, texture_RestorationShaman, texture_AfflictionWarlock, texture_DemonologyWarlock, texture_DestructionWarlock,
		texture_ArmsWarrior, texture_FuryWarrior, texture_ProtectionWarrior, texture_GeneralStuff}
		
		local all_texture_values = {{1, .49, .04,},{1, .49, .04,},{1, .49, .04,},{.67, .83, .45},{.67, .83, .45},{.67, .83, .45},
		{.41, .8, .94},{.41, .8, .94},{.41, .8, .94},{.96, .55, .73},{.96, .55, .73},{.96, .55, .73},
		{1, 1, 1},{1, 1, 1},{1, 1, 1},{1, .96, .41},{1, .96, .41},{1, .96, .41},
		{0, .44, .87},{0, .44, .87},{0, .44, .87},{.58, .51, .79},{.58, .51, .79},{.58, .51, .79},
		{.78, .61, .43},{.78, .61, .43},{.78, .61, .43},{.4,.4,.4}}

	
		for i,v in ipairs(all_buttons) do
			if self == v then
				all_textures[i]:SetTexture(all_texture_values[i][1], all_texture_values[i][2], all_texture_values[i][3], .4)
				spec_displaying = v
			else
				all_textures[i]:SetTexture(all_texture_values[i][1], all_texture_values[i][2], all_texture_values[i][3], .8)
			end
		end
		
		frame_displaying = "BASIC"
		display_frame_CA()
	
	end
	
	
	
	local TrainingFrame_CloseButton = CreateFrame("Button", "TrainingFrame_CloseButton", TrainingFrame, "UIPanelCloseButton")
		TrainingFrame_CloseButton:SetPoint("TOPRIGHT", -5, -5)
		TrainingFrame_CloseButton:EnableMouse(true)
		TrainingFrame_CloseButton:SetSize(27, 27)
		
		
	local TrainingFrame_TitleBar = CreateFrame("Frame", "TrainingFrame_TitleBar", TrainingFrame, nil)
        TrainingFrame_TitleBar:SetSize(180, 25)
        TrainingFrame_TitleBar:SetBackdrop({
            bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            tile = true,
            edgeSize = 16,
            tileSize = 16,
            insets = { left = 5, right = 5, top = 5, bottom = 5 }
        })
		TrainingFrame_TitleBar:SetPoint("TOP", -90, 9)
		local TrainingFrame_TitleText = TrainingFrame_TitleBar:CreateFontString("TrainingFrame_TitleText")
        TrainingFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 13)
        TrainingFrame_TitleText:SetSize(225, 5)
        TrainingFrame_TitleText:SetPoint("CENTER", 0, 0)
        TrainingFrame_TitleText:SetText("|cffFFC125Character Progression|r")

	-- ####################################### Spec Buttons ##############################	
	BalanceDruid = CreateFrame("Button", "TrainingFrame_BalanceDruid", TrainingFrame, nil)
        BalanceDruid:SetSize(175, 20)
        BalanceDruid:SetPoint("TOPRIGHT", -10, -40)
        BalanceDruid:EnableMouse(true)
		texture_BalanceDruid = BalanceDruid:CreateTexture("BalanceDruid")
		texture_BalanceDruid:SetAllPoints(BalanceDruid)
		texture_BalanceDruid:SetTexture(1, .49, .04, .8)
        BalanceDruid:SetNormalTexture(texture_BalanceDruid)
		font_BalanceDruid = BalanceDruid:CreateFontString("BalanceDruid_Font")
		font_BalanceDruid:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_BalanceDruid:SetShadowOffset(1, -1)
		BalanceDruid:SetFontString(font_BalanceDruid)
		BalanceDruid:SetText("Balance Druid")
        BalanceDruid:SetScript("OnMouseUp",  display_stuff)
		
		
		
		
	FeralDruid = CreateFrame("Button", "TrainingFrame_FeralDruid", TrainingFrame, nil)
        FeralDruid:SetSize(175, 20)
        FeralDruid:SetPoint("TOPRIGHT", -10, -70)
        FeralDruid:EnableMouse(true)
		texture_FeralDruid = BalanceDruid:CreateTexture("FeralDruid")
		texture_FeralDruid:SetAllPoints(FeralDruid)
		texture_FeralDruid:SetTexture(1, .49, .04, .8)
        FeralDruid:SetNormalTexture(texture_FeralDruid)
		font_FeralDruid = FeralDruid:CreateFontString("FeralDruid_Font")
		font_FeralDruid:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_FeralDruid:SetShadowOffset(1, -1)
		FeralDruid:SetFontString(font_FeralDruid)
		FeralDruid:SetText("Feral Druid")
        FeralDruid:SetScript("OnMouseUp",  display_stuff)
		
		
	RestorationDruid = CreateFrame("Button", "TrainingFrame_RestorationDruid", TrainingFrame, nil)
        RestorationDruid:SetSize(175, 20)
        RestorationDruid:SetPoint("TOPRIGHT", -10, -100)
        RestorationDruid:EnableMouse(true)
		texture_RestorationDruid = RestorationDruid:CreateTexture("RestorationDruid")
		texture_RestorationDruid:SetAllPoints(RestorationDruid)
		texture_RestorationDruid:SetTexture(1, .49, .04, .8)
        RestorationDruid:SetNormalTexture(texture_RestorationDruid)
		font_RestorationDruid = RestorationDruid:CreateFontString("RestorationDruid_Font")
		font_RestorationDruid:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_RestorationDruid:SetShadowOffset(1, -1)
		RestorationDruid:SetFontString(font_RestorationDruid)
		RestorationDruid:SetText("Restoration Druid")
        RestorationDruid:SetScript("OnMouseUp",  display_stuff)	
		
		
	BeastMasteryHunter = CreateFrame("Button", "TrainingFrame_BeastMasteryHunter", TrainingFrame, nil)
        BeastMasteryHunter:SetSize(175, 20)
        BeastMasteryHunter:SetPoint("TOPRIGHT", -10, -130)
        BeastMasteryHunter:EnableMouse(true)
		texture_BeastMasteryHunter = BeastMasteryHunter:CreateTexture("BeastMasteryHunter")
		texture_BeastMasteryHunter:SetAllPoints(BeastMasteryHunter)
		texture_BeastMasteryHunter:SetTexture(.67, .83, .45, .8)
        BeastMasteryHunter:SetNormalTexture(texture_BeastMasteryHunter)
		font_BeastMasteryHunter = BeastMasteryHunter:CreateFontString("BeastMasteryHunter_Font")
		font_BeastMasteryHunter:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_BeastMasteryHunter:SetShadowOffset(1, -1)
		BeastMasteryHunter:SetFontString(font_BeastMasteryHunter)
		BeastMasteryHunter:SetText("Beast Mastery Hunter")
        BeastMasteryHunter:SetScript("OnMouseUp",  display_stuff)
		
	
	MarksmanshipHunter = CreateFrame("Button", "TrainingFrame_MarksmanshipHunter", TrainingFrame, nil)
        MarksmanshipHunter:SetSize(175, 20)
        MarksmanshipHunter:SetPoint("TOPRIGHT", -10, -160)
        MarksmanshipHunter:EnableMouse(true)
		texture_MarksmanshipHunter = MarksmanshipHunter:CreateTexture("MarksmanshipHunter")
		texture_MarksmanshipHunter:SetAllPoints(MarksmanshipHunter)
		texture_MarksmanshipHunter:SetTexture(.67, .83, .45, .8)
        MarksmanshipHunter:SetNormalTexture(texture_MarksmanshipHunter)
		font_MarksmanshipHunter = MarksmanshipHunter:CreateFontString("MarksmanshipHunter_Font")
		font_MarksmanshipHunter:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_MarksmanshipHunter:SetShadowOffset(1, -1)
		MarksmanshipHunter:SetFontString(font_MarksmanshipHunter)
		MarksmanshipHunter:SetText("Marksmanship Hunter")
        MarksmanshipHunter:SetScript("OnMouseUp",  display_stuff)
		
		
	SurvivalHunter = CreateFrame("Button", "TrainingFrame_SurvivalHunter", TrainingFrame, nil)
        SurvivalHunter:SetSize(175, 20)
        SurvivalHunter:SetPoint("TOPRIGHT", -10, -190)
        SurvivalHunter:EnableMouse(true)
		texture_SurvivalHunter = MarksmanshipHunter:CreateTexture("SurvivalHunter")
		texture_SurvivalHunter:SetAllPoints(SurvivalHunter)
		texture_SurvivalHunter:SetTexture(.67, .83, .45, .8)
        SurvivalHunter:SetNormalTexture(texture_SurvivalHunter)
		font_SurvivalHunter = SurvivalHunter:CreateFontString("SurvivalHunter_Font")
		font_SurvivalHunter:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_SurvivalHunter:SetShadowOffset(1, -1)
		SurvivalHunter:SetFontString(font_SurvivalHunter)
		SurvivalHunter:SetText("Survival Hunter")
        SurvivalHunter:SetScript("OnMouseUp",  display_stuff)
		
		
	ArcaneMage = CreateFrame("Button", "TrainingFrame_ArcaneMage", TrainingFrame, nil)
        ArcaneMage:SetSize(175, 20)
        ArcaneMage:SetPoint("TOPRIGHT", -10, -220)
        ArcaneMage:EnableMouse(true)
		texture_ArcaneMage = ArcaneMage:CreateTexture("FireMage")
		texture_ArcaneMage:SetAllPoints(ArcaneMage)
		texture_ArcaneMage:SetTexture(.41, .8, .94, .8)
        ArcaneMage:SetNormalTexture(texture_ArcaneMage)
		font_ArcaneMage = ArcaneMage:CreateFontString("ArcaneMage_Font")
		font_ArcaneMage:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ArcaneMage:SetShadowOffset(1, -1)
		ArcaneMage:SetFontString(font_ArcaneMage)
		ArcaneMage:SetText("Arcane Mage")
        ArcaneMage:SetScript("OnMouseUp",  display_stuff)
	
		
	FireMage = CreateFrame("Button", "TrainingFrame_FireMage", TrainingFrame, nil)
        FireMage:SetSize(175, 20)
        FireMage:SetPoint("TOPRIGHT", -10, -250)
        FireMage:EnableMouse(true)
		texture_FireMage = FireMage:CreateTexture("FireMage")
		texture_FireMage:SetAllPoints(FireMage)
		texture_FireMage:SetTexture(.41, .8, .94, .8)
        FireMage:SetNormalTexture(texture_FireMage)
		font_FireMage = FireMage:CreateFontString("FireMage_Font")
		font_FireMage:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_FireMage:SetShadowOffset(1, -1)
		FireMage:SetFontString(font_FireMage)
		FireMage:SetText("Fire Mage")
        FireMage:SetScript("OnMouseUp",  display_stuff)
		
		
	FrostMage = CreateFrame("Button", "TrainingFrame_FrostMage", TrainingFrame, nil)
        FrostMage:SetSize(175, 20)
        FrostMage:SetPoint("TOPRIGHT", -10, -280)
        FrostMage:EnableMouse(true)
		texture_FrostMage = FrostMage:CreateTexture("FrostMage")
		texture_FrostMage:SetAllPoints(FrostMage)
		texture_FrostMage:SetTexture(.41, .8, .94, .8)
        FrostMage:SetNormalTexture(texture_FrostMage)
		font_FrostMage = FrostMage:CreateFontString("FrostMage_Font")
		font_FrostMage:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_FrostMage:SetShadowOffset(1, -1)
		FrostMage:SetFontString(font_FrostMage)
		FrostMage:SetText("Frost Mage")
        FrostMage:SetScript("OnMouseUp",  display_stuff)
		
	HolyPaladin = CreateFrame("Button", "TrainingFrame_HolyPaladin", TrainingFrame, nil)
        HolyPaladin:SetSize(175, 20)
        HolyPaladin:SetPoint("TOPRIGHT", -10, -310)
        HolyPaladin:EnableMouse(true)
		texture_HolyPaladin = HolyPaladin:CreateTexture("HolyPaladin")
		texture_HolyPaladin:SetAllPoints(HolyPaladin)
		texture_HolyPaladin:SetTexture(.96, .55, .73, .8)
        HolyPaladin:SetNormalTexture(texture_HolyPaladin)
		font_HolyPaladin = HolyPaladin:CreateFontString("HolyPaladin_Font")
		font_HolyPaladin:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_HolyPaladin:SetShadowOffset(1, -1)
		HolyPaladin:SetFontString(font_HolyPaladin)
		HolyPaladin:SetText("Holy Paladin")
        HolyPaladin:SetScript("OnMouseUp",  display_stuff)
		
		
	ProtectionPaladin = CreateFrame("Button", "TrainingFrame_ProtectionPaladin", TrainingFrame, nil)
        ProtectionPaladin:SetSize(175, 20)
        ProtectionPaladin:SetPoint("TOPRIGHT", -10, -340)
        ProtectionPaladin:EnableMouse(true)
		texture_ProtectionPaladin = ProtectionPaladin:CreateTexture("ProtectionPaladin")
		texture_ProtectionPaladin:SetAllPoints(ProtectionPaladin)
		texture_ProtectionPaladin:SetTexture(.96, .55, .73, .8)
        ProtectionPaladin:SetNormalTexture(texture_ProtectionPaladin)
		font_ProtectionPaladin = ProtectionPaladin:CreateFontString("ProtectionPaladin_Font")
		font_ProtectionPaladin:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ProtectionPaladin:SetShadowOffset(1, -1)
		ProtectionPaladin:SetFontString(font_ProtectionPaladin)
		ProtectionPaladin:SetText("Protection Paladin")
        ProtectionPaladin:SetScript("OnMouseUp",  display_stuff)
		
		
	RetributionPaladin = CreateFrame("Button", "TrainingFrame_RetributionPaladin", TrainingFrame, nil)
        RetributionPaladin:SetSize(175, 20)
        RetributionPaladin:SetPoint("TOPRIGHT", -10, -370)
        RetributionPaladin:EnableMouse(true)
		texture_RetributionPaladin = RetributionPaladin:CreateTexture("RetributionPaladin")
		texture_RetributionPaladin:SetAllPoints(RetributionPaladin)
		texture_RetributionPaladin:SetTexture(.96, .55, .73, .8)
        RetributionPaladin:SetNormalTexture(texture_RetributionPaladin)
		font_RetributionPaladin = RetributionPaladin:CreateFontString("RetributionPaladin_Font")
		font_RetributionPaladin:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_RetributionPaladin:SetShadowOffset(1, -1)
		RetributionPaladin:SetFontString(font_RetributionPaladin)
		RetributionPaladin:SetText("Retribution Paladin")
        RetributionPaladin:SetScript("OnMouseUp",  display_stuff)
		
		
	DisciplinePriest = CreateFrame("Button", "TrainingFrame_DisciplinePriest", TrainingFrame, nil)
        DisciplinePriest:SetSize(175, 20)
        DisciplinePriest:SetPoint("TOPRIGHT", -10, -400)
        DisciplinePriest:EnableMouse(true)
		texture_DisciplinePriest = DisciplinePriest:CreateTexture("DisciplinePriest")
		texture_DisciplinePriest:SetAllPoints(DisciplinePriest)
		texture_DisciplinePriest:SetTexture(1, 1, 1, .8)
        DisciplinePriest:SetNormalTexture(texture_DisciplinePriest)
		font_DisciplinePriest = DisciplinePriest:CreateFontString("DisciplinePriest_Font")
		font_DisciplinePriest:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_DisciplinePriest:SetShadowOffset(1, -1)
		DisciplinePriest:SetFontString(font_DisciplinePriest)
		DisciplinePriest:SetText("Discipline Priest")
        DisciplinePriest:SetScript("OnMouseUp",  display_stuff)
		
		
	HolyPriest = CreateFrame("Button", "TrainingFrame_HolyPriest", TrainingFrame, nil)
        HolyPriest:SetSize(175, 20)
        HolyPriest:SetPoint("TOPRIGHT", -10, -430)
        HolyPriest:EnableMouse(true)
		texture_HolyPriest = HolyPriest:CreateTexture("HolyPriest")
		texture_HolyPriest:SetAllPoints(HolyPriest)
		texture_HolyPriest:SetTexture(1, 1, 1, .8)
        HolyPriest:SetNormalTexture(texture_HolyPriest)
		font_HolyPriest = HolyPriest:CreateFontString("HolyPriest_Font")
		font_HolyPriest:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_HolyPriest:SetShadowOffset(1, -1)
		HolyPriest:SetFontString(font_HolyPriest)
		HolyPriest:SetText("Holy Priest")
        HolyPriest:SetScript("OnMouseUp",  display_stuff)
		
		
	ShadowPriest = CreateFrame("Button", "TrainingFrame_ShadowPriest", TrainingFrame, nil)
        ShadowPriest:SetSize(175, 20)
        ShadowPriest:SetPoint("TOPRIGHT", -10, -460)
        ShadowPriest:EnableMouse(true)
		texture_ShadowPriest = ShadowPriest:CreateTexture("ShadowPriest")
		texture_ShadowPriest:SetAllPoints(ShadowPriest)
		texture_ShadowPriest:SetTexture(1, 1, 1, .8)
        ShadowPriest:SetNormalTexture(texture_ShadowPriest)
		font_ShadowPriest = ShadowPriest:CreateFontString("ShadowPriest_Font")
		font_ShadowPriest:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ShadowPriest:SetShadowOffset(1, -1)
		ShadowPriest:SetFontString(font_ShadowPriest)
		ShadowPriest:SetText("Shadow Priest")
        ShadowPriest:SetScript("OnMouseUp",  display_stuff)
		
		
	AssassinationRogue = CreateFrame("Button", "TrainingFrame_AssassinationRogue", TrainingFrame, nil)
        AssassinationRogue:SetSize(175, 20)
        AssassinationRogue:SetPoint("TOPRIGHT", -10, -490)
        AssassinationRogue:EnableMouse(true)
		texture_AssassinationRogue = AssassinationRogue:CreateTexture("AssassinationRogue")
		texture_AssassinationRogue:SetAllPoints(AssassinationRogue)
		texture_AssassinationRogue:SetTexture(1, .96, .41, .8)
        AssassinationRogue:SetNormalTexture(texture_AssassinationRogue)
		font_AssassinationRogue = AssassinationRogue:CreateFontString("AssassinationRogue_Font")
		font_AssassinationRogue:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_AssassinationRogue:SetShadowOffset(1, -1)
		AssassinationRogue:SetFontString(font_AssassinationRogue)
		AssassinationRogue:SetText("Assassination Rogue")
        AssassinationRogue:SetScript("OnMouseUp",  display_stuff)
		
		
	CombatRogue = CreateFrame("Button", "TrainingFrame_CombatRogue", TrainingFrame, nil)
        CombatRogue:SetSize(175, 20)
        CombatRogue:SetPoint("TOPRIGHT", -10, -520)
        CombatRogue:EnableMouse(true)
		texture_CombatRogue = CombatRogue:CreateTexture("CombatRogue")
		texture_CombatRogue:SetAllPoints(CombatRogue)
		texture_CombatRogue:SetTexture(1, .96, .41, .8)
        CombatRogue:SetNormalTexture(texture_CombatRogue)
		font_CombatRogue = CombatRogue:CreateFontString("CombatRogue_Font")
		font_CombatRogue:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_CombatRogue:SetShadowOffset(1, -1)
		CombatRogue:SetFontString(font_CombatRogue)
		CombatRogue:SetText("Combat Rogue")
        CombatRogue:SetScript("OnMouseUp",  display_stuff)
		
		
	SubtletyRogue = CreateFrame("Button", "TrainingFrame_SubtletyRogue", TrainingFrame, nil)
        SubtletyRogue:SetSize(175, 20)
        SubtletyRogue:SetPoint("TOPRIGHT", -10, -550)
        SubtletyRogue:EnableMouse(true)
		texture_SubtletyRogue = SubtletyRogue:CreateTexture("SubtletyRogue")
		texture_SubtletyRogue:SetAllPoints(SubtletyRogue)
		texture_SubtletyRogue:SetTexture(1, .96, .41, .8)
        SubtletyRogue:SetNormalTexture(texture_SubtletyRogue)
		font_SubtletyRogue = SubtletyRogue:CreateFontString("SubtletyRogue_Font")
		font_SubtletyRogue:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_SubtletyRogue:SetShadowOffset(1, -1)
		SubtletyRogue:SetFontString(font_SubtletyRogue)
		SubtletyRogue:SetText("Subtlety Rogue")
        SubtletyRogue:SetScript("OnMouseUp",  display_stuff)
		
		
	ElementalShaman = CreateFrame("Button", "TrainingFrame_ElementalShaman", TrainingFrame, nil)
        ElementalShaman:SetSize(175, 20)
        ElementalShaman:SetPoint("TOPRIGHT", -10, -580)
        ElementalShaman:EnableMouse(true)
		texture_ElementalShaman = ElementalShaman:CreateTexture("ElementalShaman")
		texture_ElementalShaman:SetAllPoints(ElementalShaman)
		texture_ElementalShaman:SetTexture(0, .44, .87, .8)
        ElementalShaman:SetNormalTexture(texture_ElementalShaman)
		font_ElementalShaman = ElementalShaman:CreateFontString("ElementalShaman_Font")
		font_ElementalShaman:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ElementalShaman:SetShadowOffset(1, -1)
		ElementalShaman:SetFontString(font_ElementalShaman)
		ElementalShaman:SetText("Elemental Shaman")
        ElementalShaman:SetScript("OnMouseUp",  display_stuff)
		
		
	EnhancementShaman = CreateFrame("Button", "TrainingFrame_EnhancementShaman", TrainingFrame, nil)
        EnhancementShaman:SetSize(175, 20)
        EnhancementShaman:SetPoint("TOPRIGHT", -10, -610)
        EnhancementShaman:EnableMouse(true)
		texture_EnhancementShaman = EnhancementShaman:CreateTexture("EnhancementShaman")
		texture_EnhancementShaman:SetAllPoints(EnhancementShaman)
		texture_EnhancementShaman:SetTexture(0, .44, .87, .8)
        EnhancementShaman:SetNormalTexture(texture_EnhancementShaman)
		font_EnhancementShaman = EnhancementShaman:CreateFontString("EnhancementShaman_Font")
		font_EnhancementShaman:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_EnhancementShaman:SetShadowOffset(1, -1)
		EnhancementShaman:SetFontString(font_EnhancementShaman)
		EnhancementShaman:SetText("Enhancement Shaman")
        EnhancementShaman:SetScript("OnMouseUp",  display_stuff)
		
		
	RestorationShaman = CreateFrame("Button", "TrainingFrame_RestorationShaman", TrainingFrame, nil)
        RestorationShaman:SetSize(175, 20)
        RestorationShaman:SetPoint("TOPRIGHT", -10, -640)
        RestorationShaman:EnableMouse(true)
		texture_RestorationShaman = RestorationShaman:CreateTexture("RestorationShaman")
		texture_RestorationShaman:SetAllPoints(RestorationShaman)
		texture_RestorationShaman:SetTexture(0, .44, .87, .8)
        RestorationShaman:SetNormalTexture(texture_RestorationShaman)
		font_RestorationShaman = RestorationShaman:CreateFontString("RestorationShaman_Font")
		font_RestorationShaman:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_RestorationShaman:SetShadowOffset(1, -1)
		RestorationShaman:SetFontString(font_RestorationShaman)
		RestorationShaman:SetText("Restoration Shaman")
        RestorationShaman:SetScript("OnMouseUp",  display_stuff)
		
		
	AfflictionWarlock = CreateFrame("Button", "TrainingFrame_AfflictionWarlock", TrainingFrame, nil)
        AfflictionWarlock:SetSize(175, 20)
        AfflictionWarlock:SetPoint("TOPRIGHT", -10, -670)
        AfflictionWarlock:EnableMouse(true)
		texture_AfflictionWarlock = AfflictionWarlock:CreateTexture("AfflictionWarlock")
		texture_AfflictionWarlock:SetAllPoints(AfflictionWarlock)
		texture_AfflictionWarlock:SetTexture(.58, .51, .79, .8)
        AfflictionWarlock:SetNormalTexture(texture_AfflictionWarlock)
		font_AfflictionWarlock = AfflictionWarlock:CreateFontString("AfflictionWarlock_Font")
		font_AfflictionWarlock:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_AfflictionWarlock:SetShadowOffset(1, -1)
		AfflictionWarlock:SetFontString(font_AfflictionWarlock)
		AfflictionWarlock:SetText("Affliction Warlock")
        AfflictionWarlock:SetScript("OnMouseUp",  display_stuff)
		
	DemonologyWarlock = CreateFrame("Button", "TrainingFrame_DemonologyWarlock", TrainingFrame, nil)
        DemonologyWarlock:SetSize(175, 20)
        DemonologyWarlock:SetPoint("TOPRIGHT", -10, -700)
        DemonologyWarlock:EnableMouse(true)
		texture_DemonologyWarlock = DemonologyWarlock:CreateTexture("DemonologyWarlock")
		texture_DemonologyWarlock:SetAllPoints(DemonologyWarlock)
		texture_DemonologyWarlock:SetTexture(.58, .51, .79, .8)
        DemonologyWarlock:SetNormalTexture(texture_DemonologyWarlock)
		font_DemonologyWarlock = DemonologyWarlock:CreateFontString("DemonologyWarlock_Font")
		font_DemonologyWarlock:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_DemonologyWarlock:SetShadowOffset(1, -1)
		DemonologyWarlock:SetFontString(font_DemonologyWarlock)
		DemonologyWarlock:SetText("Demonology Warlock")
        DemonologyWarlock:SetScript("OnMouseUp",  display_stuff)
		
		
	DestructionWarlock = CreateFrame("Button", "TrainingFrame_DestructionWarlock", TrainingFrame, nil)
        DestructionWarlock:SetSize(175, 20)
        DestructionWarlock:SetPoint("TOPRIGHT", -10, -730)
        DestructionWarlock:EnableMouse(true)
		texture_DestructionWarlock = DestructionWarlock:CreateTexture("DestructionWarlock")
		texture_DestructionWarlock:SetAllPoints(DestructionWarlock)
		texture_DestructionWarlock:SetTexture(.58, .51, .79, .8)
        DestructionWarlock:SetNormalTexture(texture_DestructionWarlock)
		font_DestructionWarlock = DestructionWarlock:CreateFontString("DestructionWarlock_Font")
		font_DestructionWarlock:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_DestructionWarlock:SetShadowOffset(1, -1)
		DestructionWarlock:SetFontString(font_DestructionWarlock)
		DestructionWarlock:SetText("Destruction Warlock")
        DestructionWarlock:SetScript("OnMouseUp",  display_stuff)
		
		
	ArmsWarrior = CreateFrame("Button", "TrainingFrame_ArmsWarrior", TrainingFrame, nil)
        ArmsWarrior:SetSize(175, 20)
        ArmsWarrior:SetPoint("TOPRIGHT", -10, -760)
        ArmsWarrior:EnableMouse(true)
		texture_ArmsWarrior = ArmsWarrior:CreateTexture("ArmsWarrior")
		texture_ArmsWarrior:SetAllPoints(ArmsWarrior)
		texture_ArmsWarrior:SetTexture(.78, .61, .43, .8)
        ArmsWarrior:SetNormalTexture(texture_ArmsWarrior)
		font_ArmsWarrior = ArmsWarrior:CreateFontString("ArmsWarrior_Font")
		font_ArmsWarrior:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ArmsWarrior:SetShadowOffset(1, -1)
		ArmsWarrior:SetFontString(font_ArmsWarrior)
		ArmsWarrior:SetText("Arms Warrior")
        ArmsWarrior:SetScript("OnMouseUp",  display_stuff)
		
		
	FuryWarrior = CreateFrame("Button", "TrainingFrame_FuryWarrior", TrainingFrame, nil)
        FuryWarrior:SetSize(175, 20)
        FuryWarrior:SetPoint("TOPRIGHT", -10, -790)
        FuryWarrior:EnableMouse(true)
		texture_FuryWarrior = FuryWarrior:CreateTexture("FuryWarrior")
		texture_FuryWarrior:SetAllPoints(FuryWarrior)
		texture_FuryWarrior:SetTexture(.78, .61, .43, .8)
        FuryWarrior:SetNormalTexture(texture_FuryWarrior)
		font_FuryWarrior = FuryWarrior:CreateFontString("FuryWarrior_Font")
		font_FuryWarrior:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_FuryWarrior:SetShadowOffset(1, -1)
		FuryWarrior:SetFontString(font_FuryWarrior)
		FuryWarrior:SetText("Fury Warrior")
        FuryWarrior:SetScript("OnMouseUp",  display_stuff)
		
		
	ProtectionWarrior = CreateFrame("Button", "TrainingFrame_ProtectionWarrior", TrainingFrame, nil)
        ProtectionWarrior:SetSize(175, 20)
        ProtectionWarrior:SetPoint("TOPRIGHT", -10, -820)
        ProtectionWarrior:EnableMouse(true)
		texture_ProtectionWarrior = ProtectionWarrior:CreateTexture("ProtectionWarrior")
		texture_ProtectionWarrior:SetAllPoints(ProtectionWarrior)
		texture_ProtectionWarrior:SetTexture(.78, .61, .43, .8)
        ProtectionWarrior:SetNormalTexture(texture_ProtectionWarrior)
		font_ProtectionWarrior = ProtectionWarrior:CreateFontString("ProtectionWarrior_Font")
		font_ProtectionWarrior:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_ProtectionWarrior:SetShadowOffset(1, -1)
		ProtectionWarrior:SetFontString(font_ProtectionWarrior)
		ProtectionWarrior:SetText("Protection Warrior")
        ProtectionWarrior:SetScript("OnMouseUp",  display_stuff)
		
	GeneralStuff = CreateFrame("Button", "TrainingFrame_GeneralStuff", TrainingFrame, nil)
        GeneralStuff:SetSize(175, 20)
        GeneralStuff:SetPoint("TOPRIGHT", -10, -850)
        GeneralStuff:EnableMouse(true)
		texture_GeneralStuff = GeneralStuff:CreateTexture("GeneralStuff")
		texture_GeneralStuff:SetAllPoints(GeneralStuff)
		texture_GeneralStuff:SetTexture(.4, .4, .4, .4)
        GeneralStuff:SetNormalTexture(texture_GeneralStuff)
		font_GeneralStuff = GeneralStuff:CreateFontString("GeneralStuff_Font")
		font_GeneralStuff:SetFont("Fonts\\FRIZQT__.TTF", 11)
		font_GeneralStuff:SetShadowOffset(1, -1)
		GeneralStuff:SetFontString(font_GeneralStuff)
		GeneralStuff:SetText("General")
        GeneralStuff:SetScript("OnMouseUp",  display_stuff)
		
		spec_displaying = GeneralStuff
		
		
	-- ####################################### Frame Handling ##############################	
	
	function display_frame_CA()
	
		if frame_displaying == "BASIC" then
		
			-- shows
			DisplaySpellsButton:Show()
			DisplayTalentsButton:Show()
			
			--hides
			for i,v in ipairs(all_spell_slots) do
				v[1]:Hide()
			end
			
		elseif frame_displaying == "SPELLS" then
		
			--shows
			for i,v in ipairs(all_spell_slots) do
				v[1]:Show()
			end
			
			--hides
			DisplaySpellsButton:Hide()
			DisplayTalentsButton:Hide()
			
		end
	
	end
	
	function display_next_frame_CA(self)
	
		if self == DisplaySpellsButton then
		
			frame_displaying = "SPELLS"
		
		end
		
		display_frame_CA()
	
	end
	
	-- ####################################### Basic Frame ##############################	
	
	DisplaySpellsButton = CreateFrame("Button", "TrainingFrame_DisplaySpellsButton", TrainingFrame, nil)
        DisplaySpellsButton:SetSize(150, 75)
        DisplaySpellsButton:SetPoint("CENTER", -200, 0)
        DisplaySpellsButton:EnableMouse(true)
		texture_DisplaySpellsButton = DisplaySpellsButton:CreateTexture("DisplaySpellsButton")
		texture_DisplaySpellsButton:SetAllPoints(DisplaySpellsButton)
		texture_DisplaySpellsButton:SetTexture(.9, .2, .2, 1)
		texture_DisplaySpellsButton_p = DisplaySpellsButton:CreateTexture("DisplaySpellsButton_p")
		texture_DisplaySpellsButton_p:SetAllPoints(DisplaySpellsButton)
		texture_DisplaySpellsButton_p:SetTexture(.9, .2, .2, .5)
        DisplaySpellsButton:SetNormalTexture(texture_DisplaySpellsButton)
		DisplaySpellsButton:SetPushedTexture(texture_DisplaySpellsButton_p)
		font_DisplaySpellsButton = DisplaySpellsButton:CreateFontString("DisplaySpellsButton_Font")
		font_DisplaySpellsButton:SetFont("Fonts\\FRIZQT__.TTF", 15)
		font_DisplaySpellsButton:SetShadowOffset(1, -1)
		DisplaySpellsButton:SetFontString(font_DisplaySpellsButton)
		DisplaySpellsButton:SetText("Show Spells")
        DisplaySpellsButton:SetScript("OnMouseUp",  display_next_frame_CA)
		
		
	DisplayTalentsButton = CreateFrame("Button", "TrainingFrame_DisplayTalentsButton", TrainingFrame, nil)
        DisplayTalentsButton:SetSize(150, 75)
        DisplayTalentsButton:SetPoint("CENTER", 0, 0)
        DisplayTalentsButton:EnableMouse(true)
		texture_DisplayTalentsButton = DisplayTalentsButton:CreateTexture("DisplayTalentsButton")
		texture_DisplayTalentsButton:SetAllPoints(DisplayTalentsButton)
		texture_DisplayTalentsButton:SetTexture(.9, .2, .2, 1)
		texture_DisplayTalentsButton_p = DisplayTalentsButton:CreateTexture("DisplayTalentsButton_p")
		texture_DisplayTalentsButton_p:SetAllPoints(DisplayTalentsButton)
		texture_DisplayTalentsButton_p:SetTexture(.9, .2, .2, .5)
        DisplayTalentsButton:SetNormalTexture(texture_DisplayTalentsButton)
		DisplayTalentsButton:SetPushedTexture(texture_DisplayTalentsButton_p)
		font_DisplayTalentsButton = DisplayTalentsButton:CreateFontString("DisplayTalentsButton_Font")
		font_DisplayTalentsButton:SetFont("Fonts\\FRIZQT__.TTF", 15)
		font_DisplayTalentsButton:SetShadowOffset(1, -1)
		DisplayTalentsButton:SetFontString(font_DisplayTalentsButton)
		DisplayTalentsButton:SetText("Show Talents")
        DisplayTalentsButton:SetScript("OnMouseUp",  display_next_frame_CA)
		
		
	-- ####################################### Spells Frame ##############################	
	
	Spell_slot1 = CreateFrame("Frame", "TrainingFrame_Spell_slot1", TrainingFrame, nil)
	Spell_slot1Button = CreateFrame("Button", "TrainingFrame_Spell_slot1Button", Spell_slot1, nil)
	Spell_slot1ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot1ButtonL", Spell_slot1, nil)
	Spell_slot1ButtonLT = Spell_slot1ButtonL:CreateTexture("Spell_slot1ButtonLT")
	Spell_slot1ButtonF = Spell_slot1ButtonL:CreateFontString("Spell_slot1ButtonF")
	Spell_slot1_AttachedSpell = nil
	
	Spell_slot2 = CreateFrame("Frame", "TrainingFrame_Spell_slot2", TrainingFrame, nil)
	Spell_slot2Button = CreateFrame("Button", "TrainingFrame_Spell_slot2Button", Spell_slot2, nil)
	Spell_slot2ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot2ButtonL", Spell_slot2, nil)
	Spell_slot2ButtonLT = Spell_slot2ButtonL:CreateTexture("Spell_slot2ButtonLT")
	Spell_slot2ButtonF = Spell_slot2ButtonL:CreateFontString("Spell_slot2ButtonF")
	Spell_slot2_AttachedSpell = nil
	
	Spell_slot3 = CreateFrame("Frame", "TrainingFrame_Spell_slot3", TrainingFrame, nil)
	Spell_slot3Button = CreateFrame("Button", "TrainingFrame_Spell_slot3Button", Spell_slot3, nil)
	Spell_slot3Button = CreateFrame("Button", "TrainingFrame_Spell_slot3Button", Spell_slot3, nil)
	Spell_slot3ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot3ButtonL", Spell_slot3, nil)
	Spell_slot3ButtonLT = Spell_slot3ButtonL:CreateTexture("Spell_slot3ButtonLT")
	Spell_slot3ButtonF = Spell_slot3ButtonL:CreateFontString("Spell_slot3ButtonF")
	Spell_slot3_AttachedSpell = nil
	
	Spell_slot4 = CreateFrame("Frame", "TrainingFrame_Spell_slot4", TrainingFrame, nil)
	Spell_slot4Button = CreateFrame("Button", "TrainingFrame_Spell_slot4Button", Spell_slot4, nil)
	Spell_slot4Button = CreateFrame("Button", "TrainingFrame_Spell_slot4Button", Spell_slot4, nil)
	Spell_slot4ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot4ButtonL", Spell_slot4, nil)
	Spell_slot4ButtonLT = Spell_slot4ButtonL:CreateTexture("Spell_slot4ButtonLT")
	Spell_slot4ButtonF = Spell_slot1ButtonL:CreateFontString("Spell_slot4ButtonF")
	Spell_slot4_AttachedSpell = nil
	
	Spell_slot5 = CreateFrame("Frame", "TrainingFrame_Spell_slot5", TrainingFrame, nil)
	Spell_slot5Button = CreateFrame("Button", "TrainingFrame_Spell_slot5Button", Spell_slot5, nil)
	Spell_slot5Button = CreateFrame("Button", "TrainingFrame_Spell_slot5Button", Spell_slot5, nil)
	Spell_slot5ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot5ButtonL", Spell_slot5, nil)
	Spell_slot5ButtonLT = Spell_slot5ButtonL:CreateTexture("Spell_slot5ButtonLT")
	Spell_slot5ButtonF = Spell_slot5ButtonL:CreateFontString("Spell_slot5ButtonF")
	Spell_slot5_AttachedSpell = nil
	
	Spell_slot6 = CreateFrame("Frame", "TrainingFrame_Spell_slot6", TrainingFrame, nil)
	Spell_slot6Button = CreateFrame("Button", "TrainingFrame_Spell_slot6Button", Spell_slot6, nil)
	Spell_slot6Button = CreateFrame("Button", "TrainingFrame_Spell_slot6Button", Spell_slot6, nil)
	Spell_slot6ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot6ButtonL", Spell_slot6, nil)
	Spell_slot6ButtonLT = Spell_slot6ButtonL:CreateTexture("Spell_slot6ButtonLT")
	Spell_slot6ButtonF = Spell_slot6ButtonL:CreateFontString("Spell_slot6ButtonF")
	Spell_slot6_AttachedSpell = nil
	
	Spell_slot7 = CreateFrame("Frame", "TrainingFrame_Spell_slot7", TrainingFrame, nil)
	Spell_slot7Button = CreateFrame("Button", "TrainingFrame_Spell_slot7Button", Spell_slot7, nil)
	Spell_slot7Button = CreateFrame("Button", "TrainingFrame_Spell_slot7Button", Spell_slot7, nil)
	Spell_slot7ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot7ButtonL", Spell_slot7, nil)
	Spell_slot7ButtonLT = Spell_slot7ButtonL:CreateTexture("Spell_slot7ButtonLT")
	Spell_slot7ButtonF = Spell_slot7ButtonL:CreateFontString("Spell_slot7ButtonF")
	Spell_slot7_AttachedSpell = nil
	
	Spell_slot8 = CreateFrame("Frame", "TrainingFrame_Spell_slot8", TrainingFrame, nil)
	Spell_slot8Button = CreateFrame("Button", "TrainingFrame_Spell_slot8Button", Spell_slot8, nil)
	Spell_slot8Button = CreateFrame("Button", "TrainingFrame_Spell_slot8Button", Spell_slot8, nil)
	Spell_slot8ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot8ButtonL", Spell_slot8, nil)
	Spell_slot8ButtonLT = Spell_slot8ButtonL:CreateTexture("Spell_slot8ButtonLT")
	Spell_slot8ButtonF = Spell_slot8ButtonL:CreateFontString("Spell_slot8ButtonF")
	Spell_slot8_AttachedSpell = nil
	
	Spell_slot9 = CreateFrame("Frame", "TrainingFrame_Spell_slot9", TrainingFrame, nil)
	Spell_slot9Button = CreateFrame("Button", "TrainingFrame_Spell_slot9Button", Spell_slot9, nil)
	Spell_slot9Button = CreateFrame("Button", "TrainingFrame_Spell_slot9Button", Spell_slot9, nil)
	Spell_slot9ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot9ButtonL", Spell_slot9, nil)
	Spell_slot9ButtonLT = Spell_slot9ButtonL:CreateTexture("Spell_slot9ButtonLT")
	Spell_slot9ButtonF = Spell_slot9ButtonL:CreateFontString("Spell_slot9ButtonF")
	Spell_slot9_AttachedSpell = nil
	
	Spell_slot10 = CreateFrame("Frame", "TrainingFrame_Spell_slot10", TrainingFrame, nil)
	Spell_slot10Button = CreateFrame("Button", "TrainingFrame_Spell_slot10Button", Spell_slot10, nil)
	Spell_slot10Button = CreateFrame("Button", "TrainingFrame_Spell_slot10Button", Spell_slot10, nil)
	Spell_slot10ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot10ButtonL", Spell_slot10, nil)
	Spell_slot10ButtonLT = Spell_slot10ButtonL:CreateTexture("Spell_slot10ButtonLT")
	Spell_slot10ButtonF = Spell_slot10ButtonL:CreateFontString("Spell_slot10ButtonF")
	Spell_slot10_AttachedSpell = nil
	
	Spell_slot11 = CreateFrame("Frame", "TrainingFrame_Spell_slot11", TrainingFrame, nil)
	Spell_slot11Button = CreateFrame("Button", "TrainingFrame_Spell_slot11Button", Spell_slot11, nil)
	Spell_slot11Button = CreateFrame("Button", "TrainingFrame_Spell_slot11Button", Spell_slot11, nil)
	Spell_slot11ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot11ButtonL", Spell_slot11, nil)
	Spell_slot11ButtonLT = Spell_slot11ButtonL:CreateTexture("Spell_slot11ButtonLT")
	Spell_slot11ButtonF = Spell_slot11ButtonL:CreateFontString("Spell_slot11ButtonF")
	Spell_slot11_AttachedSpell = nil
	
	Spell_slot12 = CreateFrame("Frame", "TrainingFrame_Spell_slot12", TrainingFrame, nil)
	Spell_slot12Button = CreateFrame("Button", "TrainingFrame_Spell_slot12Button", Spell_slot12, nil)
	Spell_slot12Button = CreateFrame("Button", "TrainingFrame_Spell_slot12Button", Spell_slot12, nil)
	Spell_slot12ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot12ButtonL", Spell_slot12, nil)
	Spell_slot12ButtonLT = Spell_slot12ButtonL:CreateTexture("Spell_slot12ButtonLT")
	Spell_slot12ButtonF = Spell_slot12ButtonL:CreateFontString("Spell_slot12ButtonF")
	Spell_slot12_AttachedSpell = nil
	
	Spell_slot13 = CreateFrame("Frame", "TrainingFrame_Spell_slot13", TrainingFrame, nil)
	Spell_slot13Button = CreateFrame("Button", "TrainingFrame_Spell_slot13Button", Spell_slot13, nil)
	Spell_slot13Button = CreateFrame("Button", "TrainingFrame_Spell_slot13Button", Spell_slot13, nil)
	Spell_slot13ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot13ButtonL", Spell_slot13, nil)
	Spell_slot13ButtonLT = Spell_slot13ButtonL:CreateTexture("Spell_slot13ButtonLT")
	Spell_slot13ButtonF = Spell_slot13ButtonL:CreateFontString("Spell_slot13ButtonF")
	Spell_slot13_AttachedSpell = nil
	
	Spell_slot14 = CreateFrame("Frame", "TrainingFrame_Spell_slot14", TrainingFrame, nil)
	Spell_slot14Button = CreateFrame("Button", "TrainingFrame_Spell_slot14Button", Spell_slot14, nil)
	Spell_slot14Button = CreateFrame("Button", "TrainingFrame_Spell_slot14Button", Spell_slot14, nil)
	Spell_slot14ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot14ButtonL", Spell_slot14, nil)
	Spell_slot14ButtonLT = Spell_slot14ButtonL:CreateTexture("Spell_slot14ButtonLT")
	Spell_slot14ButtonF = Spell_slot14ButtonL:CreateFontString("Spell_slot14ButtonF")
	Spell_slot14_AttachedSpell = nil
	
	Spell_slot15 = CreateFrame("Frame", "TrainingFrame_Spell_slot15", TrainingFrame, nil)
	Spell_slot15Button = CreateFrame("Button", "TrainingFrame_Spell_slot15Button", Spell_slot15, nil)
	Spell_slot15Button = CreateFrame("Button", "TrainingFrame_Spell_slot15Button", Spell_slot15, nil)
	Spell_slot15ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot15ButtonL", Spell_slot15, nil)
	Spell_slot15ButtonLT = Spell_slot15ButtonL:CreateTexture("Spell_slot15ButtonLT")
	Spell_slot15ButtonF = Spell_slot15ButtonL:CreateFontString("Spell_slot15ButtonF")
	Spell_slot15_AttachedSpell = nil
	
	Spell_slot16 = CreateFrame("Frame", "TrainingFrame_Spell_slot16", TrainingFrame, nil)
	Spell_slot16Button = CreateFrame("Button", "TrainingFrame_Spell_slot16Button", Spell_slot16, nil)
	Spell_slot16Button = CreateFrame("Button", "TrainingFrame_Spell_slot16Button", Spell_slot16, nil)
	Spell_slot16ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot16ButtonL", Spell_slot16, nil)
	Spell_slot16ButtonLT = Spell_slot16ButtonL:CreateTexture("Spell_slot16ButtonLT")
	Spell_slot16ButtonF = Spell_slot16ButtonL:CreateFontString("Spell_slot16ButtonF")
	Spell_slot16_AttachedSpell = nil
	
	Spell_slot17 = CreateFrame("Frame", "TrainingFrame_Spell_slot17", TrainingFrame, nil)
	Spell_slot17Button = CreateFrame("Button", "TrainingFrame_Spell_slot17Button", Spell_slot17, nil)
	Spell_slot17Button = CreateFrame("Button", "TrainingFrame_Spell_slot17Button", Spell_slot17, nil)
	Spell_slot17ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot17ButtonL", Spell_slot17, nil)
	Spell_slot17ButtonLT = Spell_slot17ButtonL:CreateTexture("Spell_slot17ButtonLT")
	Spell_slot17ButtonF = Spell_slot17ButtonL:CreateFontString("Spell_slot17ButtonF")
	Spell_slot17_AttachedSpell = nil
	
	Spell_slot18 = CreateFrame("Frame", "TrainingFrame_Spell_slot18", TrainingFrame, nil)
	Spell_slot18Button = CreateFrame("Button", "TrainingFrame_Spell_slot18Button", Spell_slot18, nil)
	Spell_slot18Button = CreateFrame("Button", "TrainingFrame_Spell_slot18Button", Spell_slot18, nil)
	Spell_slot18ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot18ButtonL", Spell_slot18, nil)
	Spell_slot18ButtonLT = Spell_slot18ButtonL:CreateTexture("Spell_slot18ButtonLT")
	Spell_slot18ButtonF = Spell_slot18ButtonL:CreateFontString("Spell_slot18ButtonF")
	Spell_slot18_AttachedSpell = nil
	
	Spell_slot19 = CreateFrame("Frame", "TrainingFrame_Spell_slot19", TrainingFrame, nil)
	Spell_slot19Button = CreateFrame("Button", "TrainingFrame_Spell_slot19Button", Spell_slot19, nil)
	Spell_slot19Button = CreateFrame("Button", "TrainingFrame_Spell_slot19Button", Spell_slot19, nil)
	Spell_slot19ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot19ButtonL", Spell_slot19, nil)
	Spell_slot19ButtonLT = Spell_slot19ButtonL:CreateTexture("Spell_slot19ButtonLT")
	Spell_slot19ButtonF = Spell_slot19ButtonL:CreateFontString("Spell_slot19ButtonF")
	Spell_slot19_AttachedSpell = nil
	
	Spell_slot20 = CreateFrame("Frame", "TrainingFrame_Spell_slot20", TrainingFrame, nil)
	Spell_slot20Button = CreateFrame("Button", "TrainingFrame_Spell_slot20Button", Spell_slot20, nil)
	Spell_slot20Button = CreateFrame("Button", "TrainingFrame_Spell_slot20Button", Spell_slot20, nil)
	Spell_slot20ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot20ButtonL", Spell_slot20, nil)
	Spell_slot20ButtonLT = Spell_slot20ButtonL:CreateTexture("Spell_slot20ButtonLT")
	Spell_slot20ButtonF = Spell_slot20ButtonL:CreateFontString("Spell_slot20ButtonF")
	Spell_slot20_AttachedSpell = nil
	
	Spell_slot21 = CreateFrame("Frame", "TrainingFrame_Spell_slot21", TrainingFrame, nil)
	Spell_slot21Button = CreateFrame("Button", "TrainingFrame_Spell_slot21Button", Spell_slot21, nil)
	Spell_slot21Button = CreateFrame("Button", "TrainingFrame_Spell_slot21Button", Spell_slot21, nil)
	Spell_slot21ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot21ButtonL", Spell_slot21, nil)
	Spell_slot21ButtonLT = Spell_slot21ButtonL:CreateTexture("Spell_slot21ButtonLT")
	Spell_slot21ButtonF = Spell_slot21ButtonL:CreateFontString("Spell_slot21ButtonF")
	Spell_slot21_AttachedSpell = nil
	
	Spell_slot22 = CreateFrame("Frame", "TrainingFrame_Spell_slot22", TrainingFrame, nil)
	Spell_slot22Button = CreateFrame("Button", "TrainingFrame_Spell_slot22Button", Spell_slot22, nil)
	Spell_slot22Button = CreateFrame("Button", "TrainingFrame_Spell_slot22Button", Spell_slot22, nil)
	Spell_slot22ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot22ButtonL", Spell_slot22, nil)
	Spell_slot22ButtonLT = Spell_slot22ButtonL:CreateTexture("Spell_slot22ButtonLT")
	Spell_slot22ButtonF = Spell_slot22ButtonL:CreateFontString("Spell_slot22ButtonF")
	Spell_slot22_AttachedSpell = nil
	
	Spell_slot23 = CreateFrame("Frame", "TrainingFrame_Spell_slot23", TrainingFrame, nil)
	Spell_slot23Button = CreateFrame("Button", "TrainingFrame_Spell_slot23Button", Spell_slot23, nil)
	Spell_slot23Button = CreateFrame("Button", "TrainingFrame_Spell_slot23Button", Spell_slot23, nil)
	Spell_slot23ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot23ButtonL", Spell_slot23, nil)
	Spell_slot23ButtonLT = Spell_slot23ButtonL:CreateTexture("Spell_slot23ButtonLT")
	Spell_slot23ButtonF = Spell_slot23ButtonL:CreateFontString("Spell_slot23ButtonF")
	Spell_slot23_AttachedSpell = nil
	
	Spell_slot24 = CreateFrame("Frame", "TrainingFrame_Spell_slot24", TrainingFrame, nil)
	Spell_slot24Button = CreateFrame("Button", "TrainingFrame_Spell_slot24Button", Spell_slot24, nil)
	Spell_slot24Button = CreateFrame("Button", "TrainingFrame_Spell_slot24Button", Spell_slot24, nil)
	Spell_slot24ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot24ButtonL", Spell_slot24, nil)
	Spell_slot24ButtonLT = Spell_slot24ButtonL:CreateTexture("Spell_slot24ButtonLT")
	Spell_slot24ButtonF = Spell_slot24ButtonL:CreateFontString("Spell_slot24ButtonF")
	Spell_slot24_AttachedSpell = nil
	
	Spell_slot25 = CreateFrame("Frame", "TrainingFrame_Spell_slot25", TrainingFrame, nil)
	Spell_slot25Button = CreateFrame("Button", "TrainingFrame_Spell_slot25Button", Spell_slot25, nil)
	Spell_slot25Button = CreateFrame("Button", "TrainingFrame_Spell_slot25Button", Spell_slot25, nil)
	Spell_slot25ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot25ButtonL", Spell_slot25, nil)
	Spell_slot25ButtonLT = Spell_slot25ButtonL:CreateTexture("Spell_slot25ButtonLT")
	Spell_slot25ButtonF = Spell_slot25ButtonL:CreateFontString("Spell_slot25ButtonF")
	Spell_slot25_AttachedSpell = nil
	
	Spell_slot26 = CreateFrame("Frame", "TrainingFrame_Spell_slot26", TrainingFrame, nil)
	Spell_slot26Button = CreateFrame("Button", "TrainingFrame_Spell_slot26Button", Spell_slot26, nil)
	Spell_slot26Button = CreateFrame("Button", "TrainingFrame_Spell_slot26Button", Spell_slot26, nil)
	Spell_slot26ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot26ButtonL", Spell_slot26, nil)
	Spell_slot26ButtonLT = Spell_slot26ButtonL:CreateTexture("Spell_slot26ButtonLT")
	Spell_slot26ButtonF = Spell_slot26ButtonL:CreateFontString("Spell_slot26ButtonF")
	Spell_slot26_AttachedSpell = nil
	
	Spell_slot27 = CreateFrame("Frame", "TrainingFrame_Spell_slot27", TrainingFrame, nil)
	Spell_slot27Button = CreateFrame("Button", "TrainingFrame_Spell_slot27Button", Spell_slot27, nil)
	Spell_slot27Button = CreateFrame("Button", "TrainingFrame_Spell_slot27Button", Spell_slot27, nil)
	Spell_slot27ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot27ButtonL", Spell_slot27, nil)
	Spell_slot27ButtonLT = Spell_slot27ButtonL:CreateTexture("Spell_slot27ButtonLT")
	Spell_slot27ButtonF = Spell_slot27ButtonL:CreateFontString("Spell_slot27ButtonF")
	Spell_slot27_AttachedSpell = nil
	
	Spell_slot28 = CreateFrame("Frame", "TrainingFrame_Spell_slot28", TrainingFrame, nil)
	Spell_slot28Button = CreateFrame("Button", "TrainingFrame_Spell_slot28Button", Spell_slot28, nil)
	Spell_slot28Button = CreateFrame("Button", "TrainingFrame_Spell_slot28Button", Spell_slot28, nil)
	Spell_slot28ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot28ButtonL", Spell_slot28, nil)
	Spell_slot28ButtonLT = Spell_slot28ButtonL:CreateTexture("Spell_slot28ButtonLT")
	Spell_slot28ButtonF = Spell_slot28ButtonL:CreateFontString("Spell_slot28ButtonF")
	Spell_slot28_AttachedSpell = nil
	
	Spell_slot29 = CreateFrame("Frame", "TrainingFrame_Spell_slot29", TrainingFrame, nil)
	Spell_slot29Button = CreateFrame("Button", "TrainingFrame_Spell_slot29Button", Spell_slot29, nil)
	Spell_slot29Button = CreateFrame("Button", "TrainingFrame_Spell_slot29Button", Spell_slot29, nil)
	Spell_slot29ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot29ButtonL", Spell_slot29, nil)
	Spell_slot29ButtonLT = Spell_slot29ButtonL:CreateTexture("Spell_slot29ButtonLT")
	Spell_slot29ButtonF = Spell_slot29ButtonL:CreateFontString("Spell_slot29ButtonF")
	Spell_slot29_AttachedSpell = nil
	
	Spell_slot30 = CreateFrame("Frame", "TrainingFrame_Spell_slot30", TrainingFrame, nil)
	Spell_slot30Button = CreateFrame("Button", "TrainingFrame_Spell_slot30Button", Spell_slot24, nil)
	Spell_slot30Button = CreateFrame("Button", "TrainingFrame_Spell_slot30Button", Spell_slot30, nil)
	Spell_slot30ButtonL = CreateFrame("Button", "TrainingFrame_Spell_slot30ButtonL", Spell_slot30, nil)
	Spell_slot30ButtonLT = Spell_slot30ButtonL:CreateTexture("Spell_slot30ButtonLT")
	Spell_slot30ButtonF = Spell_slot30ButtonL:CreateFontString("Spell_slot30ButtonF")
	Spell_slot30_AttachedSpell = nil
	
	all_spell_slots = {{Spell_slot1, -340, -75},{Spell_slot2, -240, -75},{Spell_slot3, -140, -75},{Spell_slot4, -40, -75},
	{Spell_slot5, 60, -75},{Spell_slot6, 160, -75}, {Spell_slot7, -340, -225}, {Spell_slot8, -240, -225},
	{Spell_slot9, -140, -225}, {Spell_slot10, -40, -225}, {Spell_slot11, 60, -225}, {Spell_slot12, 160, -225},
	{Spell_slot13, -340, -375}, {Spell_slot14, -240, -375}, {Spell_slot15, -140, -375}, {Spell_slot16, -40, -375},
	{Spell_slot17, 60, -375}, {Spell_slot18, 160, -375}, {Spell_slot19, -340, -525}, {Spell_slot20, -240, -525},
	{Spell_slot21, -140, -525},{Spell_slot22, -40, -525},{Spell_slot23, 60, -525},{Spell_slot24, 160, -525},
	{Spell_slot25, -340, -675}, {Spell_slot26, -240, -675}, {Spell_slot27, -140, -675}, {Spell_slot28, -40, -675},
	{Spell_slot29, 60, -675}, {Spell_slot30, 160, -675}}
	
	all_spell_slot_buttons = {Spell_slot1Button, Spell_slot2Button, Spell_slot3Button, Spell_slot4Button,
	Spell_slot5Button, Spell_slot6Button, Spell_slot7Button, Spell_slot8Button,
	Spell_slot9Button, Spell_slot10Button, Spell_slot11Button, Spell_slot12Button,
	Spell_slot13Button, Spell_slot14Button, Spell_slot15Button, Spell_slot16Button,
	Spell_slot17Button, Spell_slot18Button, Spell_slot19Button, Spell_slot20Button,
	Spell_slot21Button, Spell_slot22Button, Spell_slot23Button, Spell_slot24Button,
	Spell_slot25Button, Spell_slot26Button, Spell_slot27Button, Spell_slot28Button,
	Spell_slot29Button, Spell_slot30Button}
	
	all_learn_spell_buttons = {Spell_slot1ButtonL, Spell_slot2ButtonL, Spell_slot3ButtonL, Spell_slot4ButtonL,
	Spell_slot5ButtonL, Spell_slot6ButtonL, Spell_slot7ButtonL, Spell_slot8ButtonL,
	Spell_slot9ButtonL, Spell_slot10ButtonL, Spell_slot11ButtonL, Spell_slot12ButtonL,
	Spell_slot13ButtonL, Spell_slot14ButtonL, Spell_slot15ButtonL, Spell_slot16ButtonL,
	Spell_slot17ButtonL, Spell_slot18ButtonL, Spell_slot19ButtonL, Spell_slot20ButtonL,
	Spell_slot21ButtonL, Spell_slot22ButtonL, Spell_slot23ButtonL, Spell_slot24ButtonL,
	Spell_slot25ButtonL, Spell_slot26ButtonL, Spell_slot27ButtonL, Spell_slot28ButtonL,
	Spell_slot29ButtonL, Spell_slot30ButtonL}
	
	all_learn_spell_buttons_t = {Spell_slot1ButtonLT, Spell_slot2ButtonLT, Spell_slot3ButtonLT, Spell_slot4ButtonLT,
	Spell_slot5ButtonLT, Spell_slot6ButtonLT, Spell_slot7ButtonLT, Spell_slot8ButtonLT,
	Spell_slot9ButtonLT, Spell_slot10ButtonLT, Spell_slot11ButtonLT, Spell_slot12ButtonLT,
	Spell_slot13ButtonLT, Spell_slot14ButtonLT, Spell_slot15ButtonLT, Spell_slot16ButtonLT,
	Spell_slot17ButtonLT, Spell_slot19ButtonLT, Spell_slot18ButtonLT, Spell_slot20ButtonLT,
	Spell_slot21ButtonLT, Spell_slot22ButtonLT, Spell_slot23ButtonLT, Spell_slot24ButtonLT,
	Spell_slot25ButtonLT, Spell_slot26ButtonLT, Spell_slot27ButtonLT, Spell_slot28ButtonLT,
	Spell_slot29ButtonLT, Spell_slot30ButtonLT}
	
	all_learn_spell_buttons_f = {Spell_slot1ButtonF, Spell_slot2ButtonF, Spell_slot3ButtonF, Spell_slot4ButtonF,
	Spell_slot5ButtonF, Spell_slot6ButtonF, Spell_slot7ButtonF, Spell_slot8ButtonF,
	Spell_slot9ButtonF, Spell_slot10ButtonF, Spell_slot11ButtonF, Spell_slot12ButtonF,
	Spell_slot13ButtonF, Spell_slot14ButtonF, Spell_slot15ButtonF, Spell_slot16ButtonF,
	Spell_slot17ButtonF, Spell_slot18ButtonF, Spell_slot19ButtonF, Spell_slot20ButtonF,
	Spell_slot21ButtonF, Spell_slot22ButtonF, Spell_slot23ButtonF, Spell_slot24ButtonF,
	Spell_slot25ButtonF, Spell_slot26ButtonF, Spell_slot27ButtonF, Spell_slot28ButtonF,
	Spell_slot29ButtonF, Spell_slot30ButtonF}
	
	all_attached_spells = {Spell_slot1_AttachedSpell, Spell_slot2_AttachedSpell, Spell_slot3_AttachedSpell, Spell_slot4_AttachedSpell,
	Spell_slot5_AttachedSpell, Spell_slot6_AttachedSpell, Spell_slot7_AttachedSpell, Spell_slot8_AttachedSpell,
	Spell_slot9_AttachedSpell, Spell_slot10_AttachedSpell, Spell_slot11_AttachedSpell, Spell_slot12_AttachedSpell,
	Spell_slot13_AttachedSpell, Spell_slot14_AttachedSpell, Spell_slot15_AttachedSpell, Spell_slot16_AttachedSpell,
	Spell_slot17_AttachedSpell, Spell_slot18_AttachedSpell, Spell_slot19_AttachedSpell, Spell_slot20_AttachedSpell,
	Spell_slot21_AttachedSpell, Spell_slot22_AttachedSpell, Spell_slot23_AttachedSpell, Spell_slot24_AttachedSpell,
	Spell_slot25_AttachedSpell, Spell_slot26_AttachedSpell, Spell_slot27_AttachedSpell, Spell_slot28_AttachedSpell,
	Spell_slot29_AttachedSpell, Spell_slot30_AttachedSpell}
	
	for i,v in ipairs(all_spell_slots) do
		v[1]:SetSize(60, 60)
        v[1]:SetBackdrop({
			bgFile = "Interface/CHARACTERFRAME/UI-Party-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
            edgeSize = 15
        })
		v[1]:SetPoint("TOP", v[2], v[3])
		v[1]:Hide()
	end
	
	for i,v in ipairs(all_spell_slot_buttons) do
		v:SetSize(50, 50)
        v:SetPoint("CENTER")
        v:EnableMouse(true)
		v:SetBackdrop({
			bgFile = "Interface/CHARACTERFRAME/UI-Party-Background"
        })
        v:SetScript("OnMouseUp",  nil)
	end
	
	for i,v in ipairs(all_learn_spell_buttons) do
		v:SetSize(50, 20)
        v:SetPoint("CENTER", 0, -52)
        v:EnableMouse(true)
        v:SetScript("OnMouseUp",  nil)
	end
	
	for i,v in ipairs(all_learn_spell_buttons_t) do
		v:SetAllPoints(all_learn_spell_buttons[i])
		v:SetTexture(.9, .2, .2, 1)
		all_learn_spell_buttons[i]:SetNormalTexture(v)
	end
	
	for i,v in ipairs(all_learn_spell_buttons_f) do
		v:SetFont("Fonts\\FRIZQT__.TTF", 12)
		v:SetShadowOffset(1, -1)
		all_learn_spell_buttons[i]:SetFontString(v)
		all_learn_spell_buttons[i]:SetText("Learn")
	end
		
		
	-- ####################################### Talents Frame ##############################	


	
	
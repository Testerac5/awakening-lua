local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end

local TUTORIAL_TIPS = {
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_Tex1","|cffFFFFFFAscension is a progressive Classless project, starting from Vanilla progressing through the expansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_Addons","|cffFFFFFFIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexUpgrades","|cffFFFFFFAscension iszxc jecty from softcortems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexStat","|cffFFFFFFAscension is a progresprogressing through the expansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexPortrait","|cffFFFFFFAscension is a progressive Clas through the expansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_Ffa","|cffFFFFFFAscension is a progressive Classlessthe expansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexProgress","|cffFFFFFFAscension is asions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexReset","|cffFFFFFFAscension is a progressive Classlesssions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexFreeReset","|cffFFFFFFAscension is a progrens. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_Enchant","|cffFFFFFFAscension is a progressive Classless project, startsions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexResetNotFree","|cffFFFFFFAscension is aansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_TexLoot","|cffFFFFFFAscension is a progreexpansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
{"Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_FfaEnabled","|cffFFFFFFAscension is a progressive Classless projhe realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r"},
    -- main tip -- TEX DONE
    -- Addon Settings -- TEX DONE
    -- Character Upgrades -- TEX DONE
    -- Stat Allocation -- TEX DONE
    -- Player Portrait -- TEX DONE
    -- FFA PVP -- TEX DONE
    -- level 2 Character Progression -- TEX DONE
    -- level 5 Reset spells/talents -- TEX DONE
    -- level 5 Free resets -- TEX DONE
    -- level 10 random enchants -- TEX DONE
    -- level 10 Free resets are over -- TEX DONE
    -- level 10 PvP loot on death -- TEX DONE
    -- level 20 FFA PVP is now enabled -- TEX DONE
}

local CURRENTTIP = 1
local MAXTIPS = 13

local Ascension_TutorialFrame = CreateFrame("Frame", "Ascension_TutorialFrame", UIParent, nil)
Ascension_TutorialFrame:SetSize(512,512)
--Ascension_TutorialFrame:SetAllPoints()
Ascension_TutorialFrame:SetPoint("CENTER",450,50)
Ascension_TutorialFrame:SetBackdrop({
    bgFile = "Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\Tutorial",
})
Ascension_TutorialFrame:Hide()

Ascension_TutorialFrame:SetFrameStrata("TOOLTIP")

local Ascension_TutorialFrame_CloseButton = CreateFrame("Button", "Ascension_TutorialFrame_CloseButton", Ascension_TutorialFrame, "UIPanelCloseButton")
Ascension_TutorialFrame_CloseButton:SetPoint("CENTER", 169, 116) 
Ascension_TutorialFrame_CloseButton:EnableMouse(true)
--Ascension_TutorialFrame_CloseButton:SetSize(25, 25) 
Ascension_TutorialFrame_CloseButton:SetScript("OnClick", function()
    PlaySound("igMainMenuOptionCheckBoxOn")
    Ascension_TutorialFrame:Hide()
    end)

local Ascension_TutorialFrame_TitleText = Ascension_TutorialFrame:CreateFontString("Ascension_TutorialFrame_TitleText")
Ascension_TutorialFrame_TitleText:SetFont("Fonts\\FRIZQT__.TTF", 12.2)
Ascension_TutorialFrame_TitleText:SetPoint("CENTER", 15, 116)
Ascension_TutorialFrame_TitleText:SetFontObject(GameFontNormal)
Ascension_TutorialFrame_TitleText:SetShadowOffset(1,-1)
Ascension_TutorialFrame_TitleText:SetText("Ascension Survival Guide")

local Ascension_TutorialFrameTexture = Ascension_TutorialFrame:CreateTexture(nil, "ARTWORK")
Ascension_TutorialFrameTexture:SetSize(Ascension_TutorialFrame:GetSize())
Ascension_TutorialFrameTexture:SetTexture("Interface\\AddOns\\AwAddons\\Textures\\Tutorial\\tutorial_Tex1")
Ascension_TutorialFrameTexture:SetPoint("CENTER",Ascension_TutorialFrame,0,0)

local Ascension_TutorialFrame_TextBox = CreateFrame("EditBox",nil,Ascension_TutorialFrame)
Ascension_TutorialFrame_TextBox:SetWidth(330)
Ascension_TutorialFrame_TextBox:SetHeight(30)
Ascension_TutorialFrame_TextBox:SetFontObject(GameFontNormal)

Ascension_TutorialFrame_TextBox:SetMaxLetters(420)
Ascension_TutorialFrame_TextBox:SetIndentedWordWrap(false)
Ascension_TutorialFrame_TextBox:SetMultiLine(true)
Ascension_TutorialFrame_TextBox:SetMaxResize(843, 80)
Ascension_TutorialFrame_TextBox:ClearFocus(self)
Ascension_TutorialFrame_TextBox:SetAutoFocus(false)
Ascension_TutorialFrame_TextBox:EnableMouse(false)
Ascension_TutorialFrame_TextBox:SetPoint("CENTER",Ascension_TutorialFrame,7,-40)
Ascension_TutorialFrame_TextBox:SetFont("Fonts\\FRIZQT__.TTF", 12)
Ascension_TutorialFrame_TextBox:SetJustifyH("CENTER")
Ascension_TutorialFrame_TextBox:SetText("|cffFFFFFFAscension is a progressive Classless project, starting from Vanilla progressing through the expansions. The realms vary from softcore: just the Vanilla world with Classless systems to hardcore with elements like Hunger, High risk death, and Randomly Enchanted items.|r")

local Ascension_TutorialFrame_NextButton = CreateFrame("Button", "Ascension_TutorialFrame_NextButton", Ascension_TutorialFrame, nil)
Ascension_TutorialFrame_NextButton:SetSize(26, 26)
Ascension_TutorialFrame_NextButton:SetPoint("CENTER",110,-103)
Ascension_TutorialFrame_NextButton:EnableMouse(true)

Ascension_TutorialFrame_NextButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
Ascension_TutorialFrame_NextButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
Ascension_TutorialFrame_NextButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
Ascension_TutorialFrame_NextButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")

local Ascension_TutorialFrame_PrevButton = CreateFrame("Button", "Ascension_TutorialFrame_PrevButton", Ascension_TutorialFrame, nil)
Ascension_TutorialFrame_PrevButton:SetSize(26, 26)
Ascension_TutorialFrame_PrevButton:SetPoint("CENTER",-105,-103)
Ascension_TutorialFrame_PrevButton:EnableMouse(true)

Ascension_TutorialFrame_PrevButton:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
Ascension_TutorialFrame_PrevButton:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
Ascension_TutorialFrame_PrevButton:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
Ascension_TutorialFrame_PrevButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")

 Ascension_TutorialFrame_NextButton.Text = Ascension_TutorialFrame_NextButton:CreateFontString("Ascension_TutorialFrame_NextButton.Text")
--Ascension_TutorialFrame_NextButton.Text:SetFont("Fonts\\FRIZQT__.TTF", 12.2)
Ascension_TutorialFrame_NextButton.Text:SetPoint("CENTER",-30, 0)
Ascension_TutorialFrame_NextButton.Text:SetFontObject(GameFontHighlightSmall)
Ascension_TutorialFrame_NextButton.Text:SetShadowOffset(1,-1)
Ascension_TutorialFrame_NextButton.Text:SetText("Next")

 Ascension_TutorialFrame_PrevButton.Text = Ascension_TutorialFrame_PrevButton:CreateFontString("Ascension_TutorialFrame_PrevButton.Text")
--Ascension_TutorialFrame_PrevButton.Text:SetFont("Fonts\\FRIZQT__.TTF", 12.2)
Ascension_TutorialFrame_PrevButton.Text:SetPoint("CENTER",30, 0)
Ascension_TutorialFrame_PrevButton.Text:SetFontObject(GameFontHighlightSmall)
Ascension_TutorialFrame_PrevButton.Text:SetShadowOffset(1,-1)
Ascension_TutorialFrame_PrevButton.Text:SetText("Prev")


--SCRIPTS PART--
Ascension_TutorialFrame_PrevButton:SetScript("OnUpdate", function(self)
    if (CURRENTTIP == 1) and self:IsEnabled() then
        self:Disable()
        elseif (CURRENTTIP ~= 1) then
            self:Enable()
    end
    end)

Ascension_TutorialFrame_NextButton:SetScript("OnUpdate", function(self)
    if (CURRENTTIP == MAXTIPS) and self:IsEnabled() then
        self:Disable()
        elseif (CURRENTTIP < MAXTIPS) then
            self:Enable()
    end
    end)

Ascension_TutorialFrame_PrevButton:SetScript("OnClick", function()
CURRENTTIP = CURRENTTIP -1 
    end)

Ascension_TutorialFrame_NextButton:SetScript("OnClick", function()
CURRENTTIP = CURRENTTIP +1
    end)

Ascension_TutorialFrame:SetScript("OnUpdate", function(self)
    if (Ascension_TutorialFrame_TextBox:GetText() ~= TUTORIAL_TIPS[CURRENTTIP][2]) then
        Ascension_TutorialFrameTexture:SetTexture(TUTORIAL_TIPS[CURRENTTIP][1])
        Ascension_TutorialFrame_TextBox:SetText(TUTORIAL_TIPS[CURRENTTIP][2])
    end
    end)
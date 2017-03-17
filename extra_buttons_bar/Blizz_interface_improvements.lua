local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end

local MicroButtons = {
        AchievementMicroButton,
        QuestLogMicroButton,
        SocialsMicroButton,
        PVPMicroButton,
        LFDMicroButton,
        MainMenuMicroButton,
        HelpMicroButton
}

BI_i = CreateFrame("Frame", nil, UIParent)
BI_i:SetScript("OnUpdate", function()
    if (PlayerTalentFrame) then
    if (PlayerTalentFrame:IsVisible()) then
        PlayerTalentFrameTab2:Hide()
        PlayerTalentFrameTab3:Hide()
        PlayerTalentFrameTab4:Hide()
    end
end

    if (InspectFrame) then
    if (InspectFrameTab3:IsVisible()) then
    InspectFrameTab3:Hide()
    end
    end

    if (FriendsFrameTab2:IsVisible()) then
    FriendsFrameTab2:Hide()
    end
    
    if (LFDMicroButton:IsVisible()) then
        LFDMicroButton:Hide()
        CharUpdatesMicroButton:Show()
    end
    if (TalentMicroButton:IsVisible()) then
        TalentMicroButton:Hide()
        --moving all buttons to right
        for i = 1, #MicroButtons do
            if (i == 1) then
                MicroButtons[i]:SetPoint("BOTTOMLEFT", SpellbookMicroButton, "BOTTOMRIGHT", -3, 0)
            else
            MicroButtons[i]:SetPoint("BOTTOMLEFT", MicroButtons[i-1], "BOTTOMRIGHT", -3, 0)
        end
        end
    end
    end)
BI_i:Show()

--Pet talents tab
table.insert(UnitPopupMenus["PET"], table.getn(UnitPopupMenus["PET"]), "ASCENSION_PETTALENTS");
UnitPopupButtons["ASCENSION_PETTALENTS"] = {text = "Pet Talents", dist = 0}
hooksecurefunc("UnitPopup_OnClick", function (self)
    local name = UIDROPDOWNMENU_INIT_MENU.name
    if (name == MC_PLAYER) then return end
    if (self.value == "ASCENSION_PETTALENTS") then
      ToggleTalentFrame()
    end
  end);

function IsSpellLearned(entry)
    local spellname = GetSpellInfo(entry)
    local done = false
    local known = false
    local i = 1
    local id = nil
    if not(spellname) then
      return false
    end
    spellname = string.gsub(spellname,"%(Rank %d+%)","");
    while not done do
        local name = GetSpellName(i,BOOKTYPE_SPELL);
        if not name then
        done=true;
            elseif (name==spellname) then
            known = true
            end
        i = i+1;
    end
return known
end
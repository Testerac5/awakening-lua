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
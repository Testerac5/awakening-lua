local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end

BI_i = CreateFrame("Frame", nil, UIParent)
BI_i:SetScript("OnUpdate", function()
    if (LFDMicroButton:IsVisible()) then
        LFDMicroButton:Hide()
        CharUpdatesMicroButton:Show()
    end
    
    end)
BI_i:Show()
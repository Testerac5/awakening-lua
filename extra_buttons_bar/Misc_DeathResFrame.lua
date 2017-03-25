local AIO = AIO or require("AIO")

if AIO.AddAddon() then
    return
end

local MyHandlers = AIO.AddHandlers("DeathRessurect", {})

DeathCapitalTeleportButton = CreateFrame("Button", "DeathCapitalTeleportButton", UIParent, nil) 
DeathCapitalTeleportButton:SetWidth(200) 
DeathCapitalTeleportButton:SetHeight(100) 
DeathCapitalTeleportButton:SetPoint("TOP", 0,-30) 
DeathCapitalTeleportButton:SetNormalTexture("Interface\\AddOns\\AwAddons\\Textures\\misc\\pvprev")
--font
local DeathCapitalTeleportButton_text = DeathCapitalTeleportButton:CreateFontString("TicketMasterFrame_Title")
DeathCapitalTeleportButton_text:SetFontObject(GameFontNormal)
DeathCapitalTeleportButton_text:SetText("Ressurect\nin a capital city")
DeathCapitalTeleportButton_text:SetPoint("CENTER",32,0)
--
DeathCapitalTeleportButton:SetFontString(DeathCapitalTeleportButton_text)
DeathCapitalTeleportButton:RegisterForClicks("AnyUp") 
DeathCapitalTeleportButton:SetHighlightTexture("Interface\\AddOns\\AwAddons\\Textures\\misc\\pvprev_h")
DeathCapitalTeleportButton:Hide()
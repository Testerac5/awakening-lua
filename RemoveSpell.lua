local aura = 19742

function onUse(event, player, item, target)
    RegisterPlayerEvent(5, AuraEvent)
    player:Say("Cast Spell", 7)
end

function AuraEvent(event, player, spell, skipcheck)
    local sCasted = spell:GetEntry()
        if (player:HasAura(aura)) then
            player:RemoveSpell(sCasted)
            player:RemoveAura(aura)
            player:Say("Unlearned Spell ID: "..sCasted.."", 7) --Add comment identifier once tested and put live
        end
end
RegisterItemEvent(1101243, 2, onUse)
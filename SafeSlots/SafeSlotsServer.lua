local AIO = AIO or require("AIO")

local SlotIsuranceServer = AIO.AddHandlers("SlotIsurance", {})

local Slots = { -- TEST ARRAY
    [1] = {"Head", "SafeSlot1", false},
    [2] = {"Neck", "SafeSlot2", false},
    [3] = {"Shoulder", "SafeSlot3", false},
    [4] = {"Body", "SafeSlot6", false},
    [5] = {"Chest", "SafeSlot5", false},
    [6] = {"Waist", "SafeSlot10", true},
    [7] = {"Legs", "SafeSlot11", false},
    [8] = {"Feet", "SafeSlot12", true},
    [9] = {"Wrist", "SafeSlot8", false},
    [10] = {"Hand", "SafeSlot9", false},
    [11] = {"Finger", "SafeSlot13", false},
    [12] = {"Finger", "SafeSlot14", false},
    [13] = {"Trinket", "SafeSlot15", true},
    [14] = {"Trinket", "SafeSlot16", false},
    [15] = {"Back", "SafeSlot4", false},
    [16] = {"Main Hand", "SafeSlot17", false},
    [17] = {"Off Hand", "SafeSlot18", false},
    [18] = {"Ranged", "SafeSlot19", false},
    [19] = {"Tabard", "SafeSlot7", false},
}
--!NOTE: SERVERSIDE SLOTS STARTS FROM 0, NOT FROM 1.
--!SO HEAD AND OTHER SLOTS HAVE SLOTNUMBER-1

function SlotIsuranceServer.GetSlotList(player)
    -- some db stuff here
    SafeSlots_SendList(AIO.Msg(), player,Slots):Send(player)
    end

 function SafeSlots_SendList(msg,player,SlotList)
    return msg:Add("SlotIsurance", "SafeSlots_GetList", SlotList)
end
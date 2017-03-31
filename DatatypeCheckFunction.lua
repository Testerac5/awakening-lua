local valid_types = {
    ["nil"] = true,
    ["number"] = true,
    ["string"] = true,
    ["boolean"] = true,
    ["table"] = true,
    ["function"] = true,
    ["thread"] = true,
    ["userdata"] = true,
}
 function DataTypeCheck(fmt, args)
    for k, expected in pairs(fmt) do
        local exp_type = type(expected)
        if exp_type == "string" then
            assert(valid_types[expected], "invalid type in fmt: "..tostring(expected))
            local typ = type(args[k])
            if typ ~= expected then
                return false, string.format("%s was of type %s, %s expected", tostring(k), typ, expected)
            end
        elseif exp_type == "table" then
            local typ = type(args[k])
            if typ ~= exp_type then
                return false, string.format("%s was of type %s, %s expected", tostring(k), typ, exp_type)
            end
            local succ, err = DataTypeCheck(expected, args[k])
            if not succ then
                return succ, err
            end
        else
            error("unknown expecatation in fmt: "..tostring(expected))
        end
    end
    return true
end
 
 
--[[some example usage
local fmt = {"number", "string", {}, {"number", "string", ke = {}}}
local arg = {1, "asd", {}, {1,"str", ke = {}}}
print(DataTypeCheck(fmt, arg))]]--
--HEAVY WIP--
local DataTypes = {
"boolean",
"function",
"nil",
"number",
"string",
"table",
"thread",
"userdata",
}
function CheckDataType(value,expectedData)
	if (type(value) ~= DataTypes[expectedData]) then
		return false
	end
	return true
end

-- 1 boolean - A boolean value (true or false)
-- 2 function - A function
-- 3 nil - The special value nil
-- 4 number - A numeric value
-- 5 string - A string
-- 6 table - A table
-- 7 thread - A coroutine thread
-- 8 userdata - Data external to the Lua environment (e.g. the main element of a Frame object)
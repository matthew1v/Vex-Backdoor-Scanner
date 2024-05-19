local bit32 = bit32
local bxor = bit32 and bit32.bxor or function(a, b)
    local result = 0
    local bitval = 1
    while a > 0 or b > 0 do
        local abit = a % 2
        local bbit = b % 2
        if abit ~= bbit then
            result = result + bitval
        end
        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bitval = bitval * 2
    end
    return result
end

local encoder = {}

function encoder:encode(code, key)
    local encoded = ""
    for i = 1, #code do
        local sub = string.sub(code, i, i)
        local byt = string.byte(sub)
        local bxr = bxor(byt, key or 0xff)
        encoded = encoded .. string.char(bxr)
    end
end}

function encoder:decode(code, key)
    return encoder:encode(code, key)
end

return encoder

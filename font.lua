local font = {}
local fontPath = 'res/fonts/8bit-operator-plus.ttf'

local sizes = {
    small   = 14,
    medium  = 28,
    large   = 32
}

function font.get(size_name)
    if not font[size_name] then
        font[size_name] = love.graphics.newFont(fontPath, sizes[size_name])
    end
    return font[size_name]
end

return font

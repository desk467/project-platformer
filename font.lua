local font = {}
local fontPath = 'res/fonts/8bit-operator-plus.ttf'

local sizes = {
    small   = 18,
    medium  = 32,
    large   = 48
}

function font.get(size_name)
    if not font[size_name] then
        font[size_name] = love.graphics.newFont(fontPath, sizes[size_name])
    end
    return font[size_name]
end

return font

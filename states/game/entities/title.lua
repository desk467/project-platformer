local font = require('font')

local Title = {
    id = 'T',
    category = 'title'
}

Title.__index = Title


function Title:new(x, y, text)
    local instance = setmetatable({}, Title)
    instance.x = x
    instance.y = y
    instance.text = text
    return instance
end

function Title:draw()
    love.graphics.setColor(0, 0, 0)

    love.graphics.setFont(font.get("large"))
    local font = love.graphics.getFont()
    local textWidth = font:getWidth("1-1")

    love.graphics.print(self.text, self.x - (textWidth / 2), self.y)
end

return Title

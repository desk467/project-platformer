-- imports
local font = require('font')

local Title = {}

function Title:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(font.get("large"))

    love.graphics.print("Project Platformer", 100, 100)
end

return Title

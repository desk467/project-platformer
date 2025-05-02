-- imports
local font = require('font')

local Win = {}
local Win_text = "You Won!"

function Win:draw()
    love.graphics.setBackgroundColor({0, 255, 0})
    love.graphics.setColor(255, 255, 255)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("<-", 10, 10)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("Win", 100, 100)

    love.graphics.setFont(font.get("medium"))
    love.graphics.print(Win_text, 100, 150)
end

function Win:keypressed(key)
    if key == "left" or key == "escape" then
        self.gamestate:switch('menu')
    end
end

return Win

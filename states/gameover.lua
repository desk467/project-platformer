-- imports
local font = require('font')

local Gameover = {}
local Gameover_text = "You have Died!"

function Gameover:draw()
    love.graphics.setBackgroundColor({255, 0, 0})
    love.graphics.setColor(255, 255, 255)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("<-", 10, 10)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("Gameover", 100, 100)

    love.graphics.setFont(font.get("medium"))
    love.graphics.print(Gameover_text, 100, 150)
end

function Gameover:keypressed(key)
    if key == "left" or key == "escape" then
        self.gamestate:switch('menu')
    end
end

return Gameover

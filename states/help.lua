-- imports
local font = require('font')

local Help = {}
local help_text = "use [<-] and [->] to move.\npress [spacebar] to jump.\ncollect all coins and reach the goal."

function Help:draw()
    love.graphics.setBackgroundColor({255, 255, 255})
    love.graphics.setColor(0, 0, 0)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("<-", 10, 10)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("help", 100, 100)

    love.graphics.setFont(font.get("medium"))
    love.graphics.print(help_text, 100, 150)
end

function Help:keypressed(key)
    if key == "left" or key == "escape" then
        self.gamestate:switch('menu')
    end
end

return Help

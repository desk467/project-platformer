-- imports
local Title         = require('states.menu.entities.title')
local MenuItems     = require('states.menu.entities.menu_items')

local Menu = {}

function Menu:draw()
    love.graphics.setBackgroundColor({0, 0, 0})

    Title:draw()
    MenuItems:draw()
end

function Menu:keypressed()
    MenuItems:keypressed(self.gamestate)
end

return Menu

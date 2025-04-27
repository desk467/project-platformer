-- entities
local Title = require('states.menu.entities.title')
local MenuItems = require('states.menu.entities.menu_items')

local Menu = {}

function Menu:load()
    -- Inicializa recursos do estado
end

function Menu:draw()
    love.graphics.setBackgroundColor({0, 0, 0})

    Title:draw()
    MenuItems:draw()
end

function Menu:keypressed(key)
    MenuItems:keypressed(key, self.gamestate)
end

return Menu

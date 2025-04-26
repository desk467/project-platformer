-- imports
local font = require('font')
local MenuItems = require('states.menu.menu_items')

local Menu = {}

function Menu:load()
    -- Inicializa recursos do estado
end

function Menu:draw()
    love.graphics.setBackgroundColor({0, 0, 0})
    love.graphics.setColor(255, 255, 255)

    love.graphics.setFont(font.get("large"))
    love.graphics.print("Game Engine", 100, 100)

    love.graphics.setFont(font.get("medium"))

    for idx, item_name in ipairs(MenuItems.order) do
        local item = MenuItems.items[item_name]
        if MenuItems.selected == idx then
            love.graphics.print(MenuItems.selector.char, item.x + MenuItems.selector.rel_x, item.y)
        end
        love.graphics.print(item.text, item.x, item.y)
    end
end

function Menu:update(dt)
    -- Atualiza lógica do estado
end

function Menu:keypressed(key)
    if key == "down" then
        MenuItems.selected = (MenuItems.selected % #MenuItems.order) + 1
    elseif key == "up" then
        MenuItems.selected = (MenuItems.selected - 2) % #MenuItems.order + 1
    end

    if key == "space" then
        self.gamestate:switch(MenuItems:current().state)
    end
end

return Menu

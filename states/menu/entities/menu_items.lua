-- imports
local font = require('font')

local x = 100
local y_init = 180
local y_space = 50

local function MenuItem(text, pos, state)
    return {
        text = text,
        x = x,
        y = y_init + y_space * pos,
        state = state
    }
end

local MenuItems = {
    selected = 1,
    selector = {
        char = "->",
        rel_x = -50
    },
    items = {},
    order = {}
}

setmetatable(MenuItems.items, {
    __newindex = function(t, key, value)
        rawset(t, key, value)
        table.insert(MenuItems.order, key)
    end
})

function MenuItems:current()
    local key = self.order[self.selected]
    return self.items[key] or {}
end

function MenuItems:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(font.get("medium"))

    for idx, item_name in ipairs(self.order) do
        local item = self.items[item_name]
        if self.selected == idx then
            love.graphics.print(self.selector.char, item.x + self.selector.rel_x, item.y)
        end
        love.graphics.print(item.text, item.x, item.y)
    end
end

function MenuItems:keypressed(key, gamestate)
    if key == "down" then
        self.selected = (self.selected % #self.order) + 1
    elseif key == "up" then
        self.selected = (self.selected - 2) % #self.order + 1
    end

    if key == "return" then
        gamestate:switch(self:current().state)
    end
end

-- Itens do menu
MenuItems.items.dialogs  = MenuItem("Play", 0, "game")
MenuItems.items.layouts  = MenuItem("Help", 1, "help")

return MenuItems

local x = 100
local y_init = 200
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

-- Metatable para atualizar automaticamente a ordem
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

-- Definir os itens
MenuItems.items.dialogs  = MenuItem("Dialogs", 0, "menu")
MenuItems.items.layouts  = MenuItem("Game Layouts", 1, "game")
MenuItems.items.test_c   = MenuItem("Teste C", 2, "menu")

return MenuItems

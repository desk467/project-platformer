-- imports
local Entity     = require('core.entity')
local components = require('core.components')

local function create_coin(x, y)
    local coin = Entity:new("coin")

    coin:add("position", components.Position(x, y))
    coin:add("drawable", components.Drawable({220/255, 120/255, 10/255}, "circle", {radius = 10}))

    -- TOOO: Transformar em componente
    coin.translate_y = 0
    coin.translate_y_direction = 1

    return coin
end

return create_coin

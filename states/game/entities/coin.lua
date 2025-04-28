local Entity   = require('states.game.ecs.entity')
local Position = require('states.game.ecs.components.position')
local Drawable = require('states.game.ecs.components.drawable')

local function create_coin(x, y)
    local coin = Entity:new("coin")

    coin:add("position", Position(x, y))
    coin:add("drawable", Drawable({220/255, 120/255, 10/255}, "circle", {radius = 10}))

    -- TOOO: Transformar em componente
    coin.translate_y = 0
    coin.translate_y_direction = 1

    return coin
end

return create_coin

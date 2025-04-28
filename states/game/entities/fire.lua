local Entity   = require('states.game.ecs.entity')
local Position = require('states.game.ecs.components.position')
local Drawable = require('states.game.ecs.components.drawable')

local function create_fire(x, y)
    local fire = Entity:new("fire")

    fire:add("position", Position(x, y))
    fire:add("drawable", Drawable({200/255, 40/255, 40/255}))

    return fire
end

return create_fire

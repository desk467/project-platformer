local Entity   = require('states.game.ecs.entity')
local Position = require('states.game.ecs.components.position')
local Drawable = require('states.game.ecs.components.drawable')
local Active = require('states.game.ecs.components.Active')

local function create_gate(x, y)
    local gate = Entity:new("gate")

    gate:add("position", Position(x, y))
    gate:add("active", Active(false))
    gate:add("drawable", Drawable({40/255, 200/255, 100/255}))

    return gate
end

return create_gate

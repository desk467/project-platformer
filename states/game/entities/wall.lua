local Entity   = require('states.game.ecs.entity')
local Position = require('states.game.ecs.components.position')
local Drawable = require('states.game.ecs.components.drawable')

local function create_wall(x, y)
    local wall = Entity:new("wall")
    wall:add("position", Position(x, y))
    wall:add("drawable", Drawable({40/255, 40/255, 40/255}))
    return wall
end

return create_wall

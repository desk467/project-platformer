-- imports
local Entity     = require('core.ecs.entity')
local components = require('core.components')

local function create_wall(x, y)
    local wall = Entity:new("wall")

    wall:add("position", components.Position(x, y))
    wall:add("drawable", components.Drawable({40/255, 40/255, 40/255}))

    return wall
end

return create_wall

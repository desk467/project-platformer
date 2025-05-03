-- imports
local Entity     = require('core.entity')
local components = require('core.components')

local function create_fire(x, y)
    local fire = Entity:new("fire")

    fire:add("position", components.Position(x, y))
    fire:add("drawable", components.Drawable({200/255, 40/255, 40/255}))

    return fire
end

return create_fire

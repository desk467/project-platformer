-- imports
local Entity     = require('core.entity')
local components = require('core.components')

local function create_gate(x, y)
    local gate = Entity:new("gate")

    gate:add("position", components.Position(x, y))
    gate:add("active", components.Active(false))
    gate:add("drawable", components.Drawable({40/255, 200/255, 100/255}))

    return gate
end

return create_gate

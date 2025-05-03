-- imports
local font       = require('font')
local Entity     = require('core.entity')
local components = require('core.components')

local function create_title(x, y, color, font, text)
    local title = Entity:new("title")

    title:add("position", components.Position(x, y))
    title:add("writable", components.Writable(color, font, text))

    return title
end

return create_title

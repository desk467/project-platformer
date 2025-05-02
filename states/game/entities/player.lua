-- imports
local Input        = require('core.input')
local components   = require('core.components')
local Entity       = require('core.ecs.entity')
local Events       = require('states.game.events')
local EventBus     = require('states.game.event_bus')

local function create_player(x, y)
    local player = Entity:new("player")

    player:add("position", components.Position(x, y))
    player:add("velocity", components.Velocity(0, 0))
    player:add("drawable", components.Drawable({50/255, 100/255, 200/255}))

    -- TODO: transformar em componente
    player.jump_distance = 400
    player.gravity = 900
    player.speed = 150
    player.grounded = false
    player.dy = 0

    return player
end

return create_player

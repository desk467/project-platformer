local Entity   = require('states.game.ecs.entity')
local Position = require('states.game.ecs.components.position')
local Velocity = require('states.game.ecs.components.velocity')
local Drawable = require('states.game.ecs.components.drawable')
local EventBus = require('states.game.event_bus')
local Events   = require('states.game.events')
local Input    = require('core.input')

local function create_player(x, y)
    local player = Entity:new("player")

    player:add("position", Position(x, y))
    player:add("velocity", Velocity(0, 0))
    player:add("drawable", Drawable({50/255, 100/255, 200/255}))

    -- TODO: transformar em componente
    player.jump_distance = 400
    player.gravity = 900
    player.speed = 150
    player.grounded = false
    player.dy = 0

    return player
end

return create_player

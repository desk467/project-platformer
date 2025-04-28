local Input    = require('core.input')
local EventBus = require('states.game.event_bus')
local Events   = require('states.game.events')

local InputSystem = {}

function InputSystem:update(entities, dt)
    for _, entity in ipairs(entities) do
        if entity.id ~= "player" then goto continue end

        local vel = entity:get("velocity")

        if Input:isDown("move_left") then
            vel.dx = -entity.speed
        elseif Input:isDown("move_right") then
            vel.dx = entity.speed
        else
            vel.dx = 0
        end

        ::continue::
    end
end

return InputSystem

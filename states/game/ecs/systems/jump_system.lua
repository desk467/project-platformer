local Input = require('core.input')

local JumpSystem = {}

function JumpSystem:update(entities, dt)
    for _, entity in ipairs(entities) do
        if entity.id ~= "player" then goto continue end

        if entity.grounded and Input:isDown("jump") then
            local vel = entity:get("velocity")
            vel.dy = -entity.jump_distance

            entity.grounded = false
        end

        ::continue::
    end
end

return JumpSystem

local EventBus  = require('states.game.event_bus')
local Events    = require('states.game.events')
local bump      = require('vendor.bump.bump')

local MovementSystem = {}

function MovementSystem:update(entities, bump_world, dt)
    for _, entity in ipairs(entities) do
        if entity:has("position") and entity:has("velocity") then
            local pos = entity:get("position")
            local vel = entity:get("velocity")

            -- aplicar gravidade
            vel.dy = vel.dy + (entity.gravity or 900) * dt

            local goalX = pos.x + vel.dx * dt
            local goalY = pos.y + vel.dy * dt

            -- resolve colisão com o mundo (walls)
            local actualX, actualY, collisions = bump_world:move(entity, goalX, goalY)

            pos.x = actualX
            pos.y = actualY

            entity.grounded = false

            for _, col in ipairs(collisions) do
                if col.normal.y < 0 then
                    -- colidiu com o chão
                    entity.grounded = true
                    vel.dy = 0
                elseif col.normal.y > 0 then
                    -- bateu no teto
                    vel.dy = 0
                elseif col.normal.x ~= 0 then
                    -- colidiu lateralmente
                    vel.dx = 0
                end

                -- emissao de eventos
                if col.other:has('activable') and not col.other.active then
                    goto continue
                end

                if col.other.id == "coin" then
                    EventBus:emit(Events.COIN_COLLECTED, col.other)
                elseif col.other.id == "fire" then
                    EventBus:emit(Events.PLAYER_DIED, col.other)
                elseif col.other.id == "gate" then
                    EventBus:emit(Events.PLAYER_WON, col.other)
                end

                ::continue::
            end
        end
    end
end

return MovementSystem

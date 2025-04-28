local CoinAnimationSystem = {}

function CoinAnimationSystem:update(entities, dt)
    for _, entity in ipairs(entities) do
        if entity.id == "coin" then
            entity.translate_y = entity.translate_y + entity.translate_y_direction * 20 * dt
            if entity.translate_y > 5 then
                entity.translate_y_direction = -1
            elseif entity.translate_y < -5 then
                entity.translate_y_direction = 1
            end
        end
    end
end

return CoinAnimationSystem

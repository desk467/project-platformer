local RenderSystem = {}

function RenderSystem:draw(entities)
    for _, entity in ipairs(entities) do
        if entity:has("active") and not entity:get('active') then
            goto continue
        end

        if entity:has("position") and entity:has("drawable") then
            local pos = entity:get("position")
            local drawable = entity:get("drawable")
            local yOffset = entity.translate_y or 0
            love.graphics.setColor(drawable.color)
            if drawable.shape == "circle" then
                love.graphics.circle("fill", pos.x + 16, pos.y + 16 + yOffset, drawable.size.radius)
            else
                love.graphics.rectangle("fill", pos.x, pos.y + yOffset, drawable.size.width, drawable.size.height)
            end
        end

        if entity:has("position") and entity:has("writable") then
            local pos = entity:get("position")
            local writable =  entity:get("writable")

            love.graphics.setColor(writable.color)
            love.graphics.setFont(writable.font)
            love.graphics.print(writable.text, pos.x, pos.y)
        end

        ::continue::
    end
end

return RenderSystem

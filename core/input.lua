local Input = {
    keysDown = {},
    bindings = {
        jump = {"space", "up", "w"},
        move_left = {"left", "a"},
        move_up = {"up", "w"},
        move_right = {"right", "d"},
        move_down = {"down", "s"},
        confirm = {"return", "space"}
    }
}

function Input:load()
end

function Input:update(dt)
end

function Input:keypressed(key)
    self.keysDown[key] = true
end

function Input:keyreleased(key)
    self.keysDown[key] = false
end

function Input:isDown(action)
    local keys = self.bindings[action]
    if not keys then return false end

    for _, key in ipairs(keys) do
        if love.keyboard.isDown(key) then
            return true
        end
    end

    -- TODO: Implementar Logica para Controle

    return false
end

return Input

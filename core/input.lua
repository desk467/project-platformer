local Input = {
    keysDown = {},
    bindings = {
        move_up         = {"up", "w"},
        move_left       = {"left", "a"},
        move_down       = {"down", "s"},
        move_right      = {"right", "d"},
        jump            = {"space", "up", "w"},
        confirm         = {"return", "space"}
    }
}

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

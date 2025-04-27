local Player = {}

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, 32, 32)
end

function Player:update(dt)
end

function Player:keypressed(key)
end

return Player

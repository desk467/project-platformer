-- core
local GameState = require('core.gamestate')

local state
function love.load()
    state = GameState.new({
        menu = require('states.menu'),
        game = require('states.game')
    }, "menu")
end

function love.draw()
    state:draw()
end

function love.update(dt)
    state:update(dt)
end

function love.keypressed(key)
    if state.current and state.current.keypressed then
        state.current:keypressed(key)
    end
end

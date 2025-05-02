-- imports
local Input      = require('core.input')
local GameState  = require('core.gamestate')

local state
function love.load()
    state = GameState.new({
        menu        = require('states.menu'),
        game        = require('states.game'),
        win         = require('states.win'),
        gameover    = require('states.gameover'),
        help        = require('states.help')
    }, "menu")
end

function love.draw()
    state:draw()
end

function love.update(dt)
    state:update(dt)
end

function love.keypressed(key)
    Input:keypressed(key)
    if state.current and state.current.keypressed then
        state.current:keypressed(key)
    end
end

function love.keyreleased(key)
    Input:keyreleased(key)
    if state.current and state.current.keyreleased then
        state.current:keyreleased(key)
    end
end

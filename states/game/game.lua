local World     = require('states.game.world')
local levels    = require('states.game.levels')
local Events    = require('states.game.events')
local EventBus  = require('states.game.event_bus')
local bump = require('core.bump')

local Game = {}

Game.currentLevel = 1

function Game:enter()
    EventBus:on(Events.COIN_COLLECTED, function(coin)
        self:onCoinCollected(coin)
    end)

    EventBus:on(Events.PLAYER_DIED, function()
        self:onPlayerDied()
    end)

    EventBus:on(Events.PLAYER_WON, function()
        self:onPlayerWon()
    end)
end

function Game:leave()
    EventBus:off(Events.COIN_COLLECTED)
    EventBus:off(Events.PLAYER_DIED)
    EventBus:off(Events.PLAYER_WON)
end

function Game:load(levelIndex)
    self.currentLevel = levelIndex or self.currentLevel
    local levelData = levels[self.currentLevel]

    self.world = World:new(levelData)
end

function Game:draw()
    if self.world then
        self.world:draw()
    end
end

function Game:update(dt)
    if self.world then
        self.world:update(dt)
    end
end

-- eventos
function Game:onCoinCollected(coin)
    -- remove coin da lista de entidades
    for i = #self.world.entities, 1, -1 do
        if self.world.entities[i] == coin then
            table.remove(self.world.entities, i)
            self.world.bump_world:remove(coin)
            break
        end
    end

    -- checa se ainda existem coins
    local hasCoin = false
    for _, e in ipairs(self.world.entities) do
        if e.id == "coin" then
            hasCoin = true
            break
        end
    end

    if not hasCoin then
        -- TODO: Refactor / Indexar entities importantes via chave=valor
        for _, e in ipairs(self.world.entities) do
            if e.id == "gate" then
                -- TODO: Refactor
                if e:has('active') then
                    e.components.active = true
                end

                local pos = e:get('position')
                self.world.bump_world:add(e, pos.x, pos.y, 32, 32)
                break
            end
        end
    end
end

function Game:onPlayerDied()
    self.gamestate:switch('gameover')
end

function Game:onPlayerWon()
    self.currentLevel = self.currentLevel + 1
    if levels[self.currentLevel] then
        local levelData = levels[self.currentLevel]
        self.world = World:new(levelData)
    else
        self.gamestate:switch('win')
    end
end

return Game

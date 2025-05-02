-- imports
local font           = require('font')
local create_wall    = require('states.game.entities.wall')
local create_gate    = require('states.game.entities.gate')
local create_fire    = require('states.game.entities.fire')
local create_coin    = require('states.game.entities.coin')
local create_title   = require('states.game.entities.title')
local create_player  = require('states.game.entities.player')

local EntityFactory = {
    entities = {
        P = { name = 'player',  builder = create_player },
        W = { name = 'wall',    builder = create_wall   },
        G = { name = 'gate',    builder = create_gate   },
        F = { name = 'fire',    builder = create_fire   },
        C = { name = 'coin',    builder = create_coin   }
    }
}

function EntityFactory:create(id, x, y, title)
    if id == ' ' then
    elseif id == 'T' then
        --TODO: Refactor
        return create_title(x, y, {0, 0, 0}, font.get('large'), title), "title"
    else
        return EntityFactory.entities[id].builder(x,y), EntityFactory.entities[id].name
    end
end

return EntityFactory

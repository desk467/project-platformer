-- entidades
local Title = require('states.game.entities.title')

local create_player = require('states.game.entities.player')
local create_wall   = require('states.game.entities.wall')
local create_gate   = require('states.game.entities.gate')
local create_fire   = require('states.game.entities.fire')
local create_coin   = require('states.game.entities.coin')

local EntityFactory = {}

function EntityFactory:create(id, x, y, title)
    if id == Title.id then
        return Title:new(x, y, title), Title.category
    elseif id == 'P' then
        return create_player(x, y), "player"
    elseif id == 'W' then
        return create_wall(x, y), "wall"
    elseif id == 'G' then
        return create_gate(x, y), "gate"
    elseif id == 'F' then
        return create_fire(x, y), "fire"
    elseif id == 'C' then
        return create_coin(x, y), "coin"
    end
    return nil
end

return EntityFactory

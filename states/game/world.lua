-- imports
local bump          = require('vendor.bump.bump')
local systems       = require('core.systems')
local EntityFactory = require('states.game.entity_factory')

local World = {}
World.__index = World

function World:new(levelData)
    local instance = setmetatable({}, World)
    instance.entities = {}

    instance.title = nil
    instance.bump_world = bump.newWorld()

    instance:load(levelData)

    return instance
end

function World:load(levelData)
    for y, line in ipairs(levelData.world) do
        for x, element in ipairs(line) do
            local entity, category = EntityFactory:create(element, (x - 1) * 32, (y - 1) * 32, levelData.title)
            if entity then
                local pos = entity:get("position")

                -- TODO: Refactor
                if category == 'player' then
                    table.insert(self.entities, entity)
                    self.bump_world:add(entity, pos.x, pos.y, 32, 32)
                elseif category == 'wall' then
                    table.insert(self.entities, entity)
                    self.bump_world:add(entity, pos.x, pos.y, 32, 32)
                elseif category == 'fire' then
                    table.insert(self.entities, entity)
                    self.bump_world:add(entity, pos.x, pos.y, 32, 32)
                elseif category == 'gate' then
                    table.insert(self.entities, entity)
                elseif category == 'coin' then
                    table.insert(self.entities, entity)
                    self.bump_world:add(entity, pos.x, pos.y, 16, 16)
                elseif category == 'title' then
                    table.insert(self.entities, entity)
                end
            end
        end
    end
end

function World:update(dt)
    systems.Input:update(self.entities, dt)
    systems.Movement:update(self.entities, self.bump_world, dt)
    systems.Jump:update(self.entities, dt)
    systems.CoinAnimation:update(self.entities, dt)
end

function World:draw()
    love.graphics.setBackgroundColor({255, 255, 255})

    systems.Render:draw(self.entities)
end

return World

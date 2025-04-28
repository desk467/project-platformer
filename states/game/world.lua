local bump = require('core.bump')

local EntityFactory = require('states.game.entity_factory')

local CoinAnimationSystem = require('states.game.ecs.systems.coin_animation_system')
local MovementSystem = require('states.game.ecs.systems.movement_system')
local RenderSystem = require('states.game.ecs.systems.render_system')
local InputSystem = require('states.game.ecs.systems.input_system')
local JumpSystem = require('states.game.ecs.systems.jump_system')

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
                    self.title = entity
                end
            end
        end
    end
end

function World:update(dt)
    InputSystem:update(self.entities, dt)
    MovementSystem:update(self.entities, self.bump_world, dt)
    JumpSystem:update(self.entities, dt)
    CoinAnimationSystem:update(self.entities, dt)
end

function World:draw()
    love.graphics.setBackgroundColor({255, 255, 255})

    RenderSystem:draw(self.entities)

    if self.title then self.title:draw() end
end

return World

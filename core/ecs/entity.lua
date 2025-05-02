local Entity = {}
Entity.__index = Entity

function Entity:new(id)
    local instance = setmetatable({}, Entity)
    instance.id = id
    instance.components = {}
    return instance
end

function Entity:add(componentName, componentData)
    self.components[componentName] = componentData
end

function Entity:get(componentName)
    return self.components[componentName]
end

function Entity:has(componentName)
    return self.components[componentName] ~= nil
end

return Entity

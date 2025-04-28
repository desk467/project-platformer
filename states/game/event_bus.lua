local EventBus = {
    listeners = {}
}

function EventBus:on(eventName, callback)
    if not self.listeners[eventName] then
        self.listeners[eventName] = {}
    end
    table.insert(self.listeners[eventName], callback)
end

function EventBus:off(eventName)
    self.listeners[eventName] = nil
end

function EventBus:emit(eventName, ...)
    if self.listeners[eventName] then
        for _, callback in ipairs(self.listeners[eventName]) do
            callback(...)
        end
    end
end

return EventBus

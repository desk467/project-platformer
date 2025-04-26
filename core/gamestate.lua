local GameState = {}
GameState.__index = GameState

function GameState.new(states, initial_name)
    local self = setmetatable({}, GameState)
    self.states = states or {}
    self.current = self.states[initial_name]
    if self.current then
        self.current.gamestate = self
        if self.current.load then
            self.current:load()
        end
    end
    return self
end

function GameState:load()
    if self.current and self.current.load then
        self.current:load()
    end
end

function GameState:draw()
    if self.current and self.current.draw then
        self.current:draw()
    end
end

function GameState:update(dt)
    if self.current and self.current.update then
        self.current:update(dt)
    end
end

function GameState:switch(state_name)
    local new_state = self.states[state_name]
    if new_state then
        self.current = new_state
        self.current.gamestate = self
        if self.current.load then
            self.current:load()
        end
    end
end

return GameState

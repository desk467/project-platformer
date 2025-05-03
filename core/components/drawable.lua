return function(color, shape, size)
    return {
        color = color,
        shape = shape or "rectangle", -- "rectangle" ou "circle"
        size = size or { width = 32, height = 32 }
    }
end

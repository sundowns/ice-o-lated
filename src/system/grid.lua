local gridSystem = System({COMPONENTS.grid})

function gridSystem:init(msg)
    print(msg)
end

function gridSystem:update(dt)
    print('grid is alive! '..dt)
end

function gridSystem:draw()
end

return gridSystem
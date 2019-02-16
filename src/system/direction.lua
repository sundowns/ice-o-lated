local dir = System({COMPONENTS.direction})

function dir:changeDirection(orientation)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local direction = e:get(COMPONENTS.direction)
        direction.value = CONSTANTS.ORIENTATIONS[orientation]
    end
end

return dir

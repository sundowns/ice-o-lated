local dir = System({COMPONENTS.direction, COMPONENTS.playerControlled, COMPONENTS.gridlocked})

function dir:changeDirection(orientation)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local gridlocked = e:get(COMPONENTS.gridlocked)
        local direction = e:get(COMPONENTS.direction)
        if not gridlocked.isSliding then
            direction.value = CONSTANTS.ORIENTATIONS[orientation]
        end
    end
end

return dir

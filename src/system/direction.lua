local dir = System({COMPONENTS.direction})

function dir:update(dt)
    -- local e
    -- for i = 1, self.pool.size do
    --     e = self.pool:get(i)
    --     local d = e:get(COMPONENTS.direction)
    --     d.hdir = 0
    --     d.vdir = 0
    -- end
end

function dir:change_dir(orientation)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local direction = e:get(COMPONENTS.direction)
        if not direction.isActive then
            direction.value = CONSTANTS.ORIENTATIONS[orientation]
            direction:setActive(true)
        end
    end
end

return dir

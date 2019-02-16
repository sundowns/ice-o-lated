local movement = System({COMPONENTS.position, COMPONENTS.movespeed, COMPONENTS.direction})

function movement:update(dt)
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local pos = e:get(COMPONENTS.position).pos
        local speed = e:get(COMPONENTS.movespeed)
        local direction = e:get(COMPONENTS.direction)

        local left = 0
        local right = 0
        local up = 0
        local down = 0
        if direction.hdir == 1 then
            right = 1
        else -- direction.hdir ==then -1
            left = -1
        end
        --local right = direction.hdir
        --local up = direction.vdir
        --local down = direction.vdir
        print("pos: " .. pos.x .. pos.y)
        print("speed: " .. speed.x .. speed.y)
        print(down)

        pos.x = speed.x * (left + right) * dt
        pos.y = speed.y * (up + down) * dt
    end
end

return movement

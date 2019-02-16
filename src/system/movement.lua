local movement = System({COMPONENTS.position, COMPONENTS.movespeed})

function movement:update(dt)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local pos = e:get(COMPONENTS.position).pos
        local speed = e:get(COMPONENTS.movespeed)

        local dx, dy = 0, 0
        dx = speed.x * dt
        dy = speed.y * dt
    end
end

return movement
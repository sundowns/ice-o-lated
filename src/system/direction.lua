local dir = System({COMPONENTS.direction})

function dir:update(dt)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local d =  e:get(COMPONENTS.direction)
        d.hdir = 0
        d.vdir = 0
    end
end

function dir:change_dir(hor, ver)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local d = e:get(COMPONENTS.direction)

        if hor then d.hdir = hor end 
        if ver then d.vdir = ver end
    end
end

return dir
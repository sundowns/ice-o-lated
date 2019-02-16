local keyInput = ECS.System({COMPONENTS.playerControlled})

function keyInput:update(dt)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local inputs = e:get(COMPONENTS.keyInput).inputs
        for key, func in pairs(inputs.down) do 
            if love.keyboard.isDown(key) then 
                GAME.current:emit("capture", key, true)
                func()
            end
        end
    end
end

function keyInput:keypressed(key)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local inputs = e:get(COMPONENTS.key_input).inputs
        GAME.current:emit("capture", key, true)
        for k, v in pairs(inputs.keypressed) do 
            if key == k then 
                v()
            end
        end
    end
end

function keyInput:keyreleased(key)
    local e 
    for i = 1, self.pool.size do 
        e = self.pool:get(i)
        local inputs = e:get(COMPONENTS.key_input).inputs
        GAME.current:emit("capture", key, false)
        for k, v in pairs(inputs.keyreleased) do 
            if key == k then 
                v()
            end
        end
    end
end

return keyInput
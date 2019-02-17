local logic = {}

function logic.move(orientation)
    return function()
        INSTANCES.world:emit("changeDirection", orientation)
        INSTANCES.world:emit("move")
    end
end

function logic.continueMove(orientation)
    return function()
        INSTANCES.world:emit("move")
    end
end

return logic

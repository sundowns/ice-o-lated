local logic = {}

function logic.move(orientation)
    return function()
        INSTANCES.world:emit("change_dir", orientation)
        INSTANCES.world:emit("move")
    end
end

return logic

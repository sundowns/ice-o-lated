local logic = {}

function logic.move(orientation)
    return function()
        INSTANCES.world:emit("change_dir", orientation)
    end
end

return logic

local logic = {}

function logic.moveHorizontal(d)
    return function()
        INSTANCES.world:emit("change_dir", d, nil)
    end
end

function logic.moveVertical(d)
    return function()
        INSTANCES.world:emit("change_dir", nil, d)
    end
end

return logic

assert(assets.goal)
assert(anim8)

return {
    id = "GOAL",
    image = assets.goal,
    grid = anim8.newGrid(8, 8, assets.goal:getWidth(), assets.goal:getHeight()),
    animation_names = {
        "DEFAULT"
    },
    layers = {
        {
            DEFAULT = {
                frame_duration = 1000,
                x = 1,
                y = 1,
                offset_x = 0,
                offset_y = 0,
                scale_x = 1,
                scale_y = 1,
                rotation = 0
            }
        }
    }
}

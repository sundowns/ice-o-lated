assert(assets.player)
assert(anim8)

return {
    id = "PLAYER",
    image = assets.player,
    grid = anim8.newGrid(8, 8, assets.player:getWidth(), assets.player:getHeight()),
    animation_names = {
        "STAND",
        "SLIDE"
    },
    layers = {
        {
            STAND = {
                frame_duration = 1000,
                x = 1,
                y = 1,
                offset_x = 0,
                offset_y = 0,
                scale_x = 1,
                scale_y = 1,
                rotation = 0
            },
            SLIDE = {
                frame_duration = 1000,
                x = 1,
                y = 2,
                offset_x = 0,
                offset_y = 0,
                scale_x = 1,
                scale_y = 1,
                rotation = 0
            }
        }
    }
}
return function(x, y)
    local rockImg = love.graphics.newImage("asset/obstacle.png")
    -- INSTANCES.world:emit("entityCreated", x, y)
    local rock =
        Entity():give(COMPONENTS.sprite, rockImg):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 1, x, y):apply()

    return rock
end

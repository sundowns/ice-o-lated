return function(x, y)
    local doorImg = love.graphics.newImage("asset/obstacle.png")
    local door =
        Entity():give(COMPONENTS.sprite, doorImg):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 0.25, x, y):give(COMPONENTS.openable):apply()

    return door
end

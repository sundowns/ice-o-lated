return function(x, y)
    local goalImg = love.graphics.newImage("asset/goal.png")
    local goal =
        Entity():give(COMPONENTS.sprite, goalImg):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 0.25, x, y):give(COMPONENTS.standable):give(COMPONENTS.isGoal):apply()

    return goal
end

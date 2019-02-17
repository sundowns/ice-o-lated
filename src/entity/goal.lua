return function(x, y)
    local goal =
        Entity():give(COMPONENTS.sprite, "goal", 0, 2, 2):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 0.25, x, y):give(COMPONENTS.standable):give(COMPONENTS.isGoal):apply()

    return goal
end

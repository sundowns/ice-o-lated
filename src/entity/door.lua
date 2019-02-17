return function(x, y)
    local door =
        Entity():give(COMPONENTS.sprite, "DOOR", 0, 2, 2):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 0.25, x, y):give(COMPONENTS.openable):apply()

    return door
end

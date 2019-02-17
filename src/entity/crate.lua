return function(x, y)
    local crate =
        Entity():give(COMPONENTS.sprite, "crate", 0, 4, 4):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.gridlocked, 0.25, x, y):give(COMPONENTS.direction):give(COMPONENTS.pushable):apply()

    return crate
end

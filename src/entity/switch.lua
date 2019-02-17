return function(x, y)
    local switch =
        Entity():give(COMPONENTS.sprite, "switch", 0, 2, 2):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.standable):give(COMPONENTS.pressable):give(COMPONENTS.gridlocked, 1, x, y):apply()

    return switch
end

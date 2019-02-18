return function(x, y)
    local player =
        Entity():give(COMPONENTS.sprite, "PLAYER", 0, 4, 4):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(
        COMPONENTS.keyInput,
        {
            down = {
                w = LOGIC.continueMove(CONSTANTS.ORIENTATIONS.UP),
                s = LOGIC.continueMove(CONSTANTS.ORIENTATIONS.DOWN),
                a = LOGIC.continueMove(CONSTANTS.ORIENTATIONS.LEFT),
                d = LOGIC.continueMove(CONSTANTS.ORIENTATIONS.RIGHT)
            },
            keypressed = {
                w = LOGIC.move(CONSTANTS.ORIENTATIONS.UP),
                s = LOGIC.move(CONSTANTS.ORIENTATIONS.DOWN),
                a = LOGIC.move(CONSTANTS.ORIENTATIONS.LEFT),
                d = LOGIC.move(CONSTANTS.ORIENTATIONS.RIGHT)
            }
        }
    ):give(COMPONENTS.playerControlled):give(COMPONENTS.direction, "RIGHT"):give(
        COMPONENTS.gridlocked,
        CONSTANTS.BASE_TRANSITION_SPEED,
        x,
        y
    ):give(COMPONENTS.counter, 0):apply()

    return player
end

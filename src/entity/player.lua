return function()
    local player =
        Entity():give(COMPONENTS.sprite, "PLAYER", 0, 4, 4):give(COMPONENTS.position, 0, 0):give(
        COMPONENTS.keyInput,
        {
            down = {
                w = LOGIC.move(CONSTANTS.ORIENTATIONS.UP),
                s = LOGIC.move(CONSTANTS.ORIENTATIONS.DOWN),
                a = LOGIC.move(CONSTANTS.ORIENTATIONS.LEFT),
                d = LOGIC.move(CONSTANTS.ORIENTATIONS.RIGHT)
            },
            keypressed = {
                w = LOGIC.move(CONSTANTS.ORIENTATIONS.UP),
                s = LOGIC.move(CONSTANTS.ORIENTATIONS.DOWN),
                a = LOGIC.move(CONSTANTS.ORIENTATIONS.LEFT),
                d = LOGIC.move(CONSTANTS.ORIENTATIONS.RIGHT)
            }
        }
    ):give(COMPONENTS.playerControlled):give(COMPONENTS.direction):give(
        COMPONENTS.gridlocked,
        CONSTANTS.BASE_TRANSITION_SPEED,
        1,
        1
    ):apply()

    return player
end

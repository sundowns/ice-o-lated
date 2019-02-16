local playerImg = love.graphics.newImage("asset/blob-skull-dark.png")

local player =
    Entity():give(COMPONENTS.sprite, playerImg):give(COMPONENTS.position, 0, 0):give(
    COMPONENTS.keyInput,
    {
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
    0,
    0
):apply()

return player

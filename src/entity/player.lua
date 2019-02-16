local playerImg = love.graphics.newImage("asset/blob-skull-dark.png")

local player =
    Entity():give(COMPONENTS.sprite, playerImg):give(COMPONENTS.position, 0, 0):give(COMPONENTS.movespeed, 180, 180):give(
    COMPONENTS.keyInput,
    {
        down = {
            w = LOGIC.moveVertical(-1),
            s = LOGIC.moveVertical(1),
            a = LOGIC.moveHorizontal(-1),
            d = LOGIC.moveHorizontal(1)
        }
    }
):give(COMPONENTS.playerControlled):give(COMPONENTS.direction):apply()

return player

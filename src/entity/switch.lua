return function(x, y)
    local switchImg = love.graphics.newImage("asset/blob-fire.png")
    -- INSTANCES.world:emit("entityCreated", x, y)
    local switch =
        Entity():give(COMPONENTS.sprite, switchImg):give(
        COMPONENTS.position,
        x * CONSTANTS.CELL_WIDTH,
        y * CONSTANTS.CELL_HEIGHT
    ):give(COMPONENTS.standable):give(COMPONENTS.pressable):give(COMPONENTS.gridlocked, 1, x, y):apply()

    return switch
end

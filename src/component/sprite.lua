local sprite =
    Component(
    function(e, inSprite, rot, sx, sy)
        e.sprite = inSprite
        e.rot = rot or 0

        local width, height = inSprite:getWidth(), inSprite:getHeight()
        e.sx = sx or CONSTANTS.CELL_WIDTH / width
        e.sy = sy or CONSTANTS.CELL_HEIGHT / height
    end
)

return sprite

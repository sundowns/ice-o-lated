local sprite =
    Component(
    function(e, inSprite, rot, sx, sy)
        e.sprite = inSprite
        e.rot = rot or 0
        e.sx = sx or 1
        e.sy = sy or 1
    end
)

return sprite

local direction =
    Component(
    function(e, direction)
        e.value = CONSTANTS.ORIENTATIONS[direction]
    end
)

return direction

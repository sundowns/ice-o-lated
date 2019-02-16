local direction =
    Component(
    function(e, direction)
        e.value = CONSTANTS.ORIENTATIONS[direction]
        e.isActive = false -- new direction change (false once the direction change is acted upon)
    end
)

function direction:setActive(isActive)
    self.isActive = isActive
end

return direction

local gridlocked =
    Component(
    function(e, transitionTime, x, y)
        e.transitionTime = transitionTime
        e.pos = Vector(x, y)
        e.isMoving = false
        e.isOrderedToMove = false
    end
)

function gridlocked:translate(dx, dy)
    self.pos.x = self.pos.x + dx
    self.pos.y = self.pos.y + dy
    self:setMoving(true)
end

function gridlocked:setMoving(isMoving)
    self.isMoving = isMoving
end

function gridlocked:orderToMove()
    self.isOrderedToMove = true
end

function gridlocked:orderToStopMoving()
    self.isOrderedToMove = false
end

return gridlocked

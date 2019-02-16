local gridlocked =
    Component(
    function(e, transitionTime, x, y)
        e.transitionTime = transitionTime
        e.pos = Vector(x, y)
    end
)

function gridlocked:translate(dx, dy)
    self.pos.x = self.pos.x + dx
    self.pos.y = self.pos.y + dy
end

return gridlocked

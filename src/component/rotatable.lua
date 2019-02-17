local rotatable =
    Component(
    function(e)
        e.sxModifier = 1
        e.xOffset = 0
        e.flipTimer = Timer.new()
        e.flipDuration = 0.2
        e.isFlipping = false
    end
)

function rotatable:trigger()
    self.flipTimer:clear()
    if self.sxModifier > 0 then
        self.sxModifier = 1
    else
        self.sxModifier = -1
    end
    self.isFlipping = true
    self.flipTimer:tween(self.flipDuration, self, {sxModifier = self.sxModifier * -1, xOffset = self.xOffset * -1})
    self.flipTimer:after(
        self.flipDuration,
        function()
            e.isFlipping = false
        end
    )
end

return rotatable

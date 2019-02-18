local counter =
    Component(
    function(e, start)
        e.value = start
    end
)

function counter:increment(difference)
    self.value = self.value + difference
end

return counter

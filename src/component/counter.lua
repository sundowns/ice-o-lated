local counter =
    Component(
    function(e, start)
        e.value = start
    end
)

function counter:increment()
    self.value = self.value + 1
end

return counter

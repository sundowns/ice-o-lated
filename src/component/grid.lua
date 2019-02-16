local grid =
    Component(
    function(e, cols, rows, cellWidth, cellHeight)
        e.cols = cols or 32
        e.rows = h or 16
        e.cellWidth = cellWidth or 32
        e.cellHeight = cellHeight or 32
        e.grid = {}
    end
)

return grid

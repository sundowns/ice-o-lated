local grid = Component(function(e, cols, rows, cellWidth, cellHeight) 
    e.cols = cols or 16
    e.rows = h or 16
    e.cellWidth = cellWidth or 8
    e.cellHeight = cellHeight or 8
end)

return grid
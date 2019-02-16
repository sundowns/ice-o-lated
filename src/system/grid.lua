local gridSystem = System({COMPONENTS.grid})

function gridSystem:entityAdded(e)
    local grid = e:get(COMPONENTS.grid)

    local _data = {}
    for x = 0, grid.cols do
        _data[x] = {}
        for y = 0, grid.rows do
            _data[x][y] = {
                x = x,
                y = y,
                width = grid.cellWidth,
                height = grid.cellHeight
            }
        end
    end
    grid.data = _data
end

function gridSystem:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local grid = e:get(COMPONENTS.grid).data
        for k, col in pairs(grid) do
            for n, cell in pairs(col) do
                love.graphics.setColor(1, 1, 0, 1)
                love.graphics.rectangle("line", cell.x * cell.width, cell.y * cell.height, cell.width, cell.height)
            end
        end
    end
end

return gridSystem

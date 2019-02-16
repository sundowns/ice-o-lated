local gridSystem = System({COMPONENTS.position})

function gridSystem:init(cols, rows, cellWidth, cellHeight)
    self.cols = cols or 32
    self.rows = rows or 16
    self.cellWidth = cellWidth or 32
    self.cellHeight = cellHeight or 32
    self.grid = {}

    for x = 0, self.cols do
        self.grid[x] = {}
        for y = 0, self.rows do
            self.grid[x][y] = {
                x = x,
                y = y,
                width = self.cellWidth,
                height = self.cellHeight
            }
        end
    end
end

function gridSystem:entityAdded(e)
    -- we got a man with a position, put him on our grid!!!!!!!!!!
end

function gridSystem:draw()
    for k, col in pairs(self.grid) do
        for n, cell in pairs(col) do
            love.graphics.setColor(1, 1, 0, 1)
            love.graphics.rectangle("line", cell.x * cell.width, cell.y * cell.height, cell.width, cell.height)
        end
    end
end

return gridSystem

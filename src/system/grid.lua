local gridSystem = System({COMPONENTS.position, COMPONENTS.direction, COMPONENTS.speed, "moveable"})

function gridSystem:init(cols, rows, cellWidth, cellHeight)
    self.cols = cols
    self.rows = rows
    self.cellWidth = cellWidth
    self.cellHeight = cellHeight
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

function gridSystem:update(dt)
    local e
    for i = 1, self.moveable.size do
        e = self.moveable:get(i)
        local pos = e:get(COMPONENTS.position).pos
        local speed = e:get(COMPONENTS.speed).value
        local direction = e:get(COMPONENTS.direction).value

        if direction == CONSTANTS.ORIENTATIONS.LEFT then
            pos.x = pos.x - speed * dt
        elseif direction == CONSTANTS.ORIENTATIONS.UP then
            pos.y = pos.y - speed * dt
        elseif direction == CONSTANTS.ORIENTATIONS.RIGHT then
            pos.x = pos.x + speed * dt
        elseif direction == CONSTANTS.ORIENTATIONS.DOWN then
            pos.y = pos.y + speed * dt
        end
    end
end

return gridSystem

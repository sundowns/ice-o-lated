local gridSystem = System({COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, "moveable"})

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

function gridSystem:cellExists(x, y)
    return self.grid[x] and self.grid[x][y]
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
        local direction = e:get(COMPONENTS.direction)
        local gridlocked = e:get(COMPONENTS.gridlocked)

        if direction.isActive and not gridlocked.isMoving then
            direction:setActive(false)
            if direction.value == CONSTANTS.ORIENTATIONS.LEFT then
                self:moveToNewCell(-1, 0, pos, gridlocked)
            elseif direction.value == CONSTANTS.ORIENTATIONS.UP then
                self:moveToNewCell(0, -1, pos, gridlocked)
            elseif direction.value == CONSTANTS.ORIENTATIONS.RIGHT then
                self:moveToNewCell(1, 0, pos, gridlocked)
            elseif direction.value == CONSTANTS.ORIENTATIONS.DOWN then
                self:moveToNewCell(0, 1, pos, gridlocked)
            end
        end
    end
end

function gridSystem:moveToNewCell(dx, dy, pos, gridlocked)
    if self:cellExists(gridlocked.pos.x + dx, gridlocked.pos.y + dy) then
        local newCellX = (gridlocked.pos.x + dx) * self.cellWidth
        local newCellY = (gridlocked.pos.y + dy) * self.cellHeight
        gridlocked:translate(dx, dy)
        Timer.tween(gridlocked.transitionTime, pos, {x = newCellX, y = newCellY})
        Timer.after(
            gridlocked.transitionTime,
            function()
                gridlocked:setMoving(false)
                Util.t.print(gridlocked)
                Util.t.print(pos)
            end
        )
    end
end

return gridSystem

local gridSystem =
    System(
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, "moveable"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, COMPONENTS.playerControlled, "player"}
)

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
                height = self.cellHeight,
                isOccupied = false
            }
        end
    end
end

function gridSystem:entityCreated(x, y)
    self.grid[x][y].isOccupied = true
end

function gridSystem:freeCell(x, y)
    self.grid[x][y].isOccupied = false
end

function gridSystem:cellExists(x, y)
    return self.grid[x] and self.grid[x][y]
end

function gridSystem:cellIsOccupied(x, y)
    return self.grid[x][y].isOccupied
end

function gridSystem:entityAdded(e)
    print("im here")
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

        if gridlocked.isOrderedToMove and not gridlocked.isMoving then
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

function gridSystem:move()
    for i = 1, self.player.size do
        e = self.player:get(i)

        local gridlocked = e:get(COMPONENTS.gridlocked)
        if not gridlocked.isOrderedToMove and not gridlocked.isMoving then
            gridlocked:orderToMove()
        end
    end
end

function gridSystem:moveToNewCell(dx, dy, pos, gridlocked)
    local newGridX, newGridY = gridlocked.pos.x + dx, gridlocked.pos.y + dy
    if self:cellExists(newGridX, newGridY) and not self:cellIsOccupied(newGridX, newGridY) then
        local newCellX = (newGridX) * self.cellWidth
        local newCellY = (newGridY) * self.cellHeight
        gridlocked:translate(dx, dy)
        Timer.tween(gridlocked.transitionTime, pos, {x = newCellX, y = newCellY})
        gridlocked:orderToStopMoving()
        Timer.after(
            gridlocked.transitionTime,
            function()
                gridlocked:setMoving(false)
            end
        )
    end
end

return gridSystem

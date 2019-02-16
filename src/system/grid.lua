local gridSystem =
    System(
    {COMPONENTS.position, COMPONENTS.gridlocked, "gridbased"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, "moveable"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, COMPONENTS.playerControlled, "player"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, COMPONENTS.pushable, "pushable"},
    {COMPONENTS.position, COMPONENTS.gridlocked, COMPONENTS.pressable, "pressable"}
)

function gridSystem:init()
    self.cols = 0
    self.rows = 0
    self.tileWidth = 0
    self.tileHeight = 0
    self.cellWidth = 0
    self.cellHeight = 0
    self.grid = {}
    self.stage = nil
end

function gridSystem:createGrid(cols, rows, tileWidth, tileHeight, cellWidth, cellHeight, tiles, tileSet)
    self.cols = cols
    self.rows = rows
    self.tileWidth = tileWidth
    self.tileHeight = tileHeight
    self.cellWidth = cellWidth
    self.cellHeight = cellHeight
    self.tileSet = tileSet
    self.grid = {}

    Util.t.print(self.tileSet)
    Util.t.print(tiles[1][1])
    for x = 1, self.cols do
        self.grid[x] = {}
        for y = 1, self.rows do
            assert(tiles[x][y])
            local tileType = tileSet.tiles[tiles[x][y].id]

            local slidey = false
            if tileType and tileType.properties and tileType.properties.SLIDEY then
                slidey = true
            end

            self.grid[x][y] = {
                x = x,
                y = y,
                width = self.cellWidth,
                height = self.cellHeight,
                tileQuad = tiles[x][y].quad,
                isOccupied = false,
                slidey = slidey
            }
        end
    end

    INSTANCES.world:emit("gridCreated", Vector(self.cols * self.cellWidth / 2, self.rows * self.cellHeight / 2))
    INSTANCES.world:addEntity(ENTITIES.player)
end

function gridSystem:freeCell(x, y)
    self.grid[x][y].isOccupied = false
    local e
    for i = 1, self.pressable.size do
        e = self.pressable:get(i)
        local gridlocked = e:get(COMPONENTS.gridlocked)
        if gridlocked.pos.x == x and gridlocked.pos.y == y then
            e:get(COMPONENTS.pressable).isPressed = false
            print("unclick")
        end
    end
end

function gridSystem:fillCell(x, y)
    self.grid[x][y].isOccupied = true
    local e
    for i = 1, self.pressable.size do
        e = self.pressable:get(i)
        local gridlocked = e:get(COMPONENTS.gridlocked)
        if gridlocked.pos.x == x and gridlocked.pos.y == y then
            e:get(COMPONENTS.pressable).isPressed = true
            print("click")
        end
    end
end

function gridSystem:cellExists(x, y)
    return self.grid[x] and self.grid[x][y]
end

function gridSystem:cellIsOccupied(x, y)
    return self.grid[x][y].isOccupied
end

function gridSystem:entityAdded(e)
    if not e:has(COMPONENTS.standable) then
        local gridpos = e:get(COMPONENTS.gridlocked).pos
        local position = e:get(COMPONENTS.position).pos
        position.x = gridpos.x * self.cellWidth
        position.y = gridpos.y * self.cellHeight
        self.grid[gridpos.x][gridpos.y].isOccupied = true
    end
end

function gridSystem:draw()
    if self.stage then
        self.stage:draw(self.cellWidth / self.tileWidth * 2, self.cellHeight / self.tileHeight * 2, 32 / 8, 32 / 8)
    end

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
                self:moveToNewCell(-1, 0, pos, gridlocked, direction)
            elseif direction.value == CONSTANTS.ORIENTATIONS.UP then
                self:moveToNewCell(0, -1, pos, gridlocked, direction)
            elseif direction.value == CONSTANTS.ORIENTATIONS.RIGHT then
                self:moveToNewCell(1, 0, pos, gridlocked, direction)
            elseif direction.value == CONSTANTS.ORIENTATIONS.DOWN then
                self:moveToNewCell(0, 1, pos, gridlocked, direction)
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

function gridSystem:moveToNewCell(dx, dy, pos, gridlocked, direction)
    local newGridX, newGridY = gridlocked.pos.x + dx, gridlocked.pos.y + dy
    local oldGridX, oldGridY = gridlocked.pos.x, gridlocked.pos.y

    -- -- TODO: REMOVE
    -- local cell = self.grid[newGridX][newGridY]
    -- print(cell.slidey)
    -- -- TODO: REMOVE

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
                self:freeCell(oldGridX, oldGridY)
                self:fillCell(newGridX, newGridY)
            end
        )
    elseif self:cellExists(newGridX, newGridY) and self:cellIsOccupied(newGridX, newGridY) then
        gridlocked:orderToStopMoving()
        self:pushed(newGridX, newGridY, direction)
    end
end

function gridSystem:pushed(x, y, direction)
    local e
    for i = 1, self.pushable.size do
        e = self.pushable:get(i)

        local pos = e:get(COMPONENTS.position).pos
        local direction = e:get(COMPONENTS.direction)
        local gridlocked = e:get(COMPONENTS.gridlocked)
        if gridlocked.pos.x == x and gridlocked.pos.y == y then
            if not gridlocked.isMoving then
                if direction.value == CONSTANTS.ORIENTATIONS.LEFT then
                    self:moveToNewCell(-1, 0, pos, gridlocked, direction)
                elseif direction.value == CONSTANTS.ORIENTATIONS.UP then
                    self:moveToNewCell(0, -1, pos, gridlocked, direction)
                elseif direction.value == CONSTANTS.ORIENTATIONS.RIGHT then
                    self:moveToNewCell(1, 0, pos, gridlocked, direction)
                elseif direction.value == CONSTANTS.ORIENTATIONS.DOWN then
                    self:moveToNewCell(0, 1, pos, gridlocked, direction)
                end
            end
        end
    end
end

function gridSystem:stageLoaded(stage)
    self.stage = stage
    assert(stage.tilesets[1])
    assert(stage.layers["Floor"]) --TODO: floor
    local cols, rows, tileWidth, tileHeight, tilesArray = readTileLayerData(stage.layers["Floor"])
    self:createGrid(cols, rows, tileWidth, tileHeight, 32, 32, tilesArray, stage.tilesets[1])
end

function readTileLayerData(tileLayer)
    assert(tileLayer.data)
    local cols = #tileLayer.data -- not 100% which one should be cols and which should be rows cause theyre same atm
    assert(tileLayer.data[1])
    local rows = #tileLayer.data[1]
    assert(tileLayer.data[1][1].width)
    assert(tileLayer.data[1][1].height)
    local tileWidth = tileLayer.data[1][1].width
    local tileHeight = tileLayer.data[1][1].height
    return cols, rows, tileWidth, tileHeight, tileLayer.data
end

return gridSystem

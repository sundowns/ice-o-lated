local gridSystem =
    System(
    {COMPONENTS.position, COMPONENTS.gridlocked, "gridbased"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, "moveable"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, COMPONENTS.playerControlled, "player"},
    {COMPONENTS.position, COMPONENTS.direction, COMPONENTS.gridlocked, COMPONENTS.pushable, "pushable"},
    {COMPONENTS.position, COMPONENTS.gridlocked, COMPONENTS.pressable, "pressable"},
    {COMPONENTS.position, COMPONENTS.gridlocked, COMPONENTS.standable, "standable"},
    {COMPONENTS.position, COMPONENTS.gridlocked, COMPONENTS.openable, "openable"}
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

function gridSystem:createGrid(cols, rows, tileWidth, tileHeight, cellWidth, cellHeight, tiles, tileSet, objects)
    self.cols = cols
    self.rows = rows
    self.tileWidth = tileWidth
    self.tileHeight = tileHeight
    self.cellWidth = cellWidth
    self.cellHeight = cellHeight
    self.tileSet = tileSet
    self.grid = {}

    function getTileById(tiles, id)
        local result = nil
        for i, v in ipairs(tiles) do
            if id == v.id then
                result = v
            end
        end
        return result
    end

    for x = 1, self.cols do
        self.grid[x] = {}
        for y = 1, self.rows do
            assert(tiles[y][x])
            local tileType = getTileById(tileSet.tiles, tiles[y][x].id)

            local slidey = false
            if tileType and tileType.properties and tileType.properties.SLIDEY then
                slidey = true
            end

            self.grid[x][y] = {
                x = x,
                y = y,
                width = self.cellWidth,
                height = self.cellHeight,
                isOccupied = false,
                slidey = slidey
            }
        end
    end

    local spawned = false
    for i, object in ipairs(objects) do
        local gridX = (object.worldX / self.tileWidth) + 1
        local gridY = (object.worldY / self.tileHeight)
        if object.type == "Crate" then
            INSTANCES.world:addEntity(ENTITIES.crate(gridX, gridY))
        elseif object.type == "Rock" then
            INSTANCES.world:addEntity(ENTITIES.rock(gridX, gridY))
        elseif object.type == "Switch" then
            INSTANCES.world:addEntity(ENTITIES.switch(gridX, gridY))
        elseif object.type == "Door" then
            INSTANCES.world:addEntity(ENTITIES.door(gridX, gridY))
        elseif object.type == "Goal" then
            INSTANCES.world:addEntity(ENTITIES.goal(gridX, gridY))
        elseif object.type == "Spawn" then
            INSTANCES.world:addEntity(ENTITIES.player(gridX, gridY))
            spawned = true
        end
    end

    if not spawned then
        -- spawn top left by default
        INSTANCES.world:addEntity(ENTITIES.player(1, 1))
    end
end

function gridSystem:evaluateAllSwitches()
    local totalPressed = 0
    for i = 1, self.pressable.size do
        local e = self.pressable:get(i)
        if e:get(COMPONENTS.pressable).isPressed then
            totalPressed = totalPressed + 1
        end
    end

    if totalPressed == self.pressable.size then
        -- all pressed, open doors
        for i = 1, self.openable.size do
            local f = self.openable:get(i)
            local pos = f:get(COMPONENTS.gridlocked).pos
            f.isOpen = true
            f:get(COMPONENTS.sprite).visible = false
            self:freeCell(pos.x, pos.y)
            AUDIO.buttonPress:play()
        end
    else
        for i = 1, self.openable.size do
            local f = self.openable:get(i)
            local pos = f:get(COMPONENTS.gridlocked).pos
            f.isOpen = false
            f:get(COMPONENTS.sprite).visible = true
            self:fillCell(pos.x, pos.y)
            AUDIO.buttonPress:play()
        end
    end
end

function gridSystem:freeCell(x, y)
    self.grid[x][y].isOccupied = false
    local e
    for i = 1, self.pressable.size do
        e = self.pressable:get(i)
        local gridlocked = e:get(COMPONENTS.gridlocked)
        if gridlocked.pos.x == x and gridlocked.pos.y == y then
            e:get(COMPONENTS.pressable).isPressed = false
            self:evaluateAllSwitches()
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
            self:evaluateAllSwitches()
        end
    end
end

function gridSystem:cellExists(x, y)
    return self.grid[x] and self.grid[x][y]
end

function gridSystem:cellIsOccupied(x, y)
    return self.grid[x][y].isOccupied
end

function gridSystem:cellIsSlidey(x, y)
    return self.grid[x][y].slidey
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
    for i = 1, self.player.size do
        e = self.player:get(i)

        local counter = e:get(COMPONENTS.counter)
        love.graphics.print("Moves Taken: " .. counter.value, 0, 30)
    end

    if self.stage then
        love.graphics.push()
        love.graphics.translate(
            WORLD_OFFSET.x + (self.cellWidth / self.tileWidth + 28),
            WORLD_OFFSET.y + (self.cellHeight / self.tileHeight + 28)
        ) -- fuck this & fuck u
        love.graphics.scale(self.cellWidth / self.tileWidth, self.cellHeight / self.tileHeight)
        if self.stage.layers["Floor"] then
            self.stage.layers["Floor"]:draw()
        end

        if self.stage.layers["Cosmetic"] then
            self.stage.layers["Cosmetic"]:draw()
        end

        love.graphics.pop()
    end

    --DRAW THE GRID

    --for k, col in pairs(self.grid) do
    --    for n, cell in pairs(col) do
    --        love.graphics.setColor(0, 0, 0, 0.15)
    --        love.graphics.rectangle(
    --            "line",
    --            WORLD_OFFSET.x + cell.x * cell.width,
    --            WORLD_OFFSET.y + cell.y * cell.height,
    --            cell.width,
    --            cell.height
    --        )
    --    end
    --end
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
                self:moveToNewCell(-1, 0, e)
            elseif direction.value == CONSTANTS.ORIENTATIONS.UP then
                self:moveToNewCell(0, -1, e)
            elseif direction.value == CONSTANTS.ORIENTATIONS.RIGHT then
                self:moveToNewCell(1, 0, e)
            elseif direction.value == CONSTANTS.ORIENTATIONS.DOWN then
                self:moveToNewCell(0, 1, e)
            end
        end

        if e:has(COMPONENTS.playerControlled) then
            local f
            for j = self.standable.size, 1, -1 do
                f = self.standable:get(j)

                standable_pos = f:get(COMPONENTS.gridlocked).pos
                if standable_pos.x == gridlocked.pos.x and standable_pos.y == gridlocked.pos.y then
                    if f:has(COMPONENTS.goal) then
                        AUDIO.goalReached:play()
                        INSTANCES.world:emit("goalReached")
                    end
                end
            end
        end
    end
end

function gridSystem:move()
    for i = 1, self.player.size do
        e = self.player:get(i)

        local gridlocked = e:get(COMPONENTS.gridlocked)
        if not gridlocked.isOrderedToMove and not gridlocked.isMoving and not gridlocked.isSliding then
            gridlocked:orderToMove()
        end
    end
end

function gridSystem:moveToNewCell(dx, dy, entity)
    local gridlocked = entity:get(COMPONENTS.gridlocked)
    local direction = entity:get(COMPONENTS.direction)
    local pos = entity:get(COMPONENTS.position).pos
    local newGridX, newGridY = gridlocked.pos.x + dx, gridlocked.pos.y + dy
    local oldGridX, oldGridY = gridlocked.pos.x, gridlocked.pos.y

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
                local sliding = self:cellIsSlidey(newGridX, newGridY)
                gridlocked:setSliding(sliding)
                if sliding then
                    gridlocked:orderToMove()
                end
                if entity:has(COMPONENTS.playerControlled) and entity:has(COMPONENTS.sprite) then
                    if sliding then
                        INSTANCES.world:emit("spriteStateUpdated", entity, "SLIDE")
                        AUDIO.iceStep:play()
                    else
                        INSTANCES.world:emit("spriteStateUpdated", entity, "STAND")
                        AUDIO.snowStep:play()
                    end
                    entity:get(COMPONENTS.counter):update(1)
                end
            end
        )
    elseif self:cellExists(newGridX, newGridY) and self:cellIsOccupied(newGridX, newGridY) then
        gridlocked:orderToStopMoving()
        if not gridlocked.isSliding then
            self:pushed(newGridX, newGridY, direction)
            AUDIO.pushBlock:play()
        end
        gridlocked:setSliding(false)
    end
    if not self:cellExists(newGridX, newGridY) or self:cellIsOccupied(newGridX, newGridY) then
        gridlocked:setSliding(false)
    end
end

function gridSystem:pushed(x, y, playerDirection)
    local e
    for i = 1, self.pushable.size do
        e = self.pushable:get(i)

        local gridlocked = e:get(COMPONENTS.gridlocked)
        if gridlocked.pos.x == x and gridlocked.pos.y == y then
            local pos = e:get(COMPONENTS.position).pos
            local direction = e:get(COMPONENTS.direction)
            direction.value = playerDirection.value
            if not gridlocked.isMoving then
                if direction.value == CONSTANTS.ORIENTATIONS.LEFT then
                    self:moveToNewCell(-1, 0, e)
                elseif direction.value == CONSTANTS.ORIENTATIONS.UP then
                    self:moveToNewCell(0, -1, e)
                elseif direction.value == CONSTANTS.ORIENTATIONS.RIGHT then
                    self:moveToNewCell(1, 0, e)
                elseif direction.value == CONSTANTS.ORIENTATIONS.DOWN then
                    self:moveToNewCell(0, 1, e)
                end
            end
        end
    end
end

function gridSystem:stageLoaded(stage)
    self.stage = stage
    assert(stage.tilesets[1])
    assert(stage.layers["Floor"])
    local cols, rows, tileWidth, tileHeight, tilesArray = readTileLayerData(stage.layers["Floor"])
    local objects = readObjectLayerData(stage.layers["Objects"])

    --update the world offset
    local offsetX = (love.graphics.getWidth() / 2) - (cols * CONSTANTS.CELL_WIDTH / 2)
    local offsetY = (love.graphics.getHeight() / 2) - (rows * CONSTANTS.CELL_HEIGHT / 2)
    WORLD_OFFSET = Vector(offsetX, offsetY)
    self:createGrid(
        cols,
        rows,
        tileWidth,
        tileHeight,
        CONSTANTS.CELL_WIDTH,
        CONSTANTS.CELL_HEIGHT,
        tilesArray,
        stage.tilesets[1],
        objects
    )

    INSTANCES.world:enableUpdates()
end

function readTileLayerData(tileLayer)
    assert(tileLayer.data)
    local rows = #tileLayer.data -- not 100% which one should be cols and which should be rows cause theyre same atm
    assert(tileLayer.data[1])
    local cols = #tileLayer.data[1]
    assert(tileLayer.data[1][1].width)
    assert(tileLayer.data[1][1].height)
    local tileWidth = tileLayer.data[1][1].width
    local tileHeight = tileLayer.data[1][1].height
    return cols, rows, tileWidth, tileHeight, tileLayer.data
end

function readObjectLayerData(objectLayer)
    assert(objectLayer.objects)

    local objects = {}

    for i, object in pairs(objectLayer.objects) do
        assert(object.type)
        table.insert(
            objects,
            {
                type = object.type,
                worldX = object.x,
                worldY = object.y
            }
        )
    end
    return objects
end

return gridSystem

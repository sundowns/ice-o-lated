local gridSystem = System({COMPONENTS.position}, {COMPONENTS.position, COMPONENTS.direction, "moveable"})

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

function gridSystem:update(dt)
    -- local e
    -- for i = 1, self.pool.size do
    --     e = self.pool:get(i)
    --     local pos = e:get(COMPONENTS.position).pos
    --     local speed = e:get(COMPONENTS.movespeed)
    --     local direction = e:get(COMPONENTS.direction)
    --     local left = 0
    --     local right = 0
    --     local up = 0
    --     local down = 0
    --     if direction.hdir == 1 then
    --         right = 1
    --     else -- direction.hdir ==then -1
    --         left = -1
    --     end
    --     --local right = direction.hdir
    --     --local up = direction.vdir
    --     --local down = direction.vdir
    --     -- print("pos: " .. pos.x .. pos.y)
    --     -- print("speed: " .. speed.x .. speed.y)
    --     -- print(down)
    --     pos.x = speed.x * (left + right) * dt
    --     pos.y = speed.y * (up + down) * dt
    -- end
end

return gridSystem

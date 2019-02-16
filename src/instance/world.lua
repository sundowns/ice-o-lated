local world = Instance()

local gridSystem = SYSTEMS.grid(CONSTANTS.COLUMNS, CONSTANTS.ROWS, CONSTANTS.CELL_WIDTH, CONSTANTS.CELL_WIDTH)
local dir = SYSTEMS.direction()
local keyInput = SYSTEMS.keyInput()
local renderSprite = SYSTEMS.renderSprite()

world:addEntity(ENTITIES.player)

world:addSystem(gridSystem, "draw")
world:addSystem(gridSystem, "update")

world:addSystem(dir, "update")
world:addSystem(dir, "change_dir")

world:addSystem(keyInput, "update")
world:addSystem(keyInput, "keypressed")
world:addSystem(keyInput, "keyreleased")

world:addSystem(renderSprite, "draw")

world:enableSystem(gridSystem, "draw")
world:enableSystem(gridSystem, "update")

world:enableSystem(dir, "update")
world:enableSystem(dir, "change_dir")

world:enableSystem(keyInput, "update")
world:enableSystem(keyInput, "keypressed")
world:enableSystem(keyInput, "keyreleased")

world:enableSystem(renderSprite, "draw")

return world

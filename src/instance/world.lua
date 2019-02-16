local world = Instance()

local gridSystem = SYSTEMS.grid(CONSTANTS.COLUMNS, CONSTANTS.ROWS, CONSTANTS.CELL_WIDTH, CONSTANTS.CELL_WIDTH)
local dir = SYSTEMS.direction()
local keyInput = SYSTEMS.keyInput()
local renderSprite = SYSTEMS.renderSprite()
local stageManager = SYSTEMS.stageManager()

world:addEntity(ENTITIES.player)

-- ADD SYSTEMS

world:addSystem(stageManager, "draw")
world:addSystem(stageManager, "update")
world:addSystem(stageManager, "loadStage")

world:addSystem(gridSystem, "draw")
world:addSystem(gridSystem, "update")
world:addSystem(gridSystem, "move")
world:addSystem(gridSystem, "entityCreated")
world:addSystem(gridSystem, "stageLoaded")

world:addSystem(dir, "changeDirection")

world:addSystem(keyInput, "update")
world:addSystem(keyInput, "keypressed")
world:addSystem(keyInput, "keyreleased")

world:addSystem(renderSprite, "draw")

-- ENABLE SYSTEMS

world:enableSystem(stageManager, "draw")
world:enableSystem(stageManager, "update")
world:enableSystem(stageManager, "loadStage")

world:enableSystem(gridSystem, "draw")
world:enableSystem(gridSystem, "update")
world:enableSystem(gridSystem, "move")
world:enableSystem(gridSystem, "entityCreated")
world:enableSystem(gridSystem, "stageLoaded")

world:enableSystem(dir, "changeDirection")

world:enableSystem(keyInput, "update")
world:enableSystem(keyInput, "keypressed")
world:enableSystem(keyInput, "keyreleased")

world:enableSystem(renderSprite, "draw")

return world

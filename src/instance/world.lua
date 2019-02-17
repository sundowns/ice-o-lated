local world = Instance()

local gridSystem = SYSTEMS.grid()
local dir = SYSTEMS.direction()
local keyInput = SYSTEMS.keyInput()
local renderSprite = SYSTEMS.renderSprite()
local stageManager = SYSTEMS.stageManager()

-- ADD SYSTEMS

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
world:addSystem(renderSprite, "update")
world:addSystem(renderSprite, "spriteStateUpdated")

-- ENABLE SYSTEMS

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
world:enableSystem(renderSprite, "update")
world:enableSystem(renderSprite, "spriteStateUpdated")

return world

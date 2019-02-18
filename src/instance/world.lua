local world = Instance()

local gridSystem = SYSTEMS.grid()
local dir = SYSTEMS.direction()
local keyInput = SYSTEMS.keyInput()
local spriteRenderer = SYSTEMS.spriteRenderer()
local stageManager = SYSTEMS.stageManager()

-- ADD SYSTEMS

world:addSystem(stageManager, "update")
world:addSystem(stageManager, "nextStage")
world:addSystem(stageManager, "goalReached")
world:addSystem(stageManager, "restartStage")
world:addSystem(stageManager, "draw")

world:addSystem(gridSystem, "draw")
world:addSystem(gridSystem, "update")
world:addSystem(gridSystem, "move")
world:addSystem(gridSystem, "entityCreated")
world:addSystem(gridSystem, "stageLoaded")

world:addSystem(dir, "changeDirection")

world:addSystem(keyInput, "update")
world:addSystem(keyInput, "keypressed")
world:addSystem(keyInput, "keyreleased")

world:addSystem(spriteRenderer, "draw")
world:addSystem(spriteRenderer, "update")
world:addSystem(spriteRenderer, "spriteStateUpdated")

-- ENABLE SYSTEMS

world:enableSystem(stageManager, "nextStage")
world:enableSystem(stageManager, "goalReached")
world:enableSystem(stageManager, "restartStage")
world:enableSystem(stageManager, "draw")

world:enableSystem(gridSystem, "draw")
world:enableSystem(gridSystem, "move")
world:enableSystem(gridSystem, "entityCreated")
world:enableSystem(gridSystem, "stageLoaded")

world:enableSystem(dir, "changeDirection")

world:enableSystem(keyInput, "keypressed")
world:enableSystem(keyInput, "keyreleased")

world:enableSystem(spriteRenderer, "draw")
world:enableSystem(spriteRenderer, "spriteStateUpdated")
function world:enableUpdates()
    world:enableSystem(stageManager, "update")
    world:enableSystem(gridSystem, "update")
    world:enableSystem(keyInput, "update")
    world:enableSystem(spriteRenderer, "update")
end

function world:disableUpdates()
    world:disableSystem(stageManager, "update")
    world:disableSystem(gridSystem, "update")
    world:disableSystem(keyInput, "update")
    world:disableSystem(spriteRenderer, "update")
end

world:enableUpdates()

return world

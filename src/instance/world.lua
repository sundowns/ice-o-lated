local world = Instance()

world:addEntity(ENTITIES.player)
world:addEntity(ENTITIES.grid)

local gridSystem = SYSTEMS.grid("ello!!!")

world:addSystem(gridSystem, "draw")

world:enableSystem(gridSystem, "update")
world:enableSystem(gridSystem, "draw")

return world

local world = Instance()

local gridSystem = SYSTEMS.grid('ello!!!')

world:addEntity(ENTITIES.player)
world:addSystem(gridSystem, "update")
world:addSystem(gridSystem, "draw")

world:enableSystem(gridSystem, "update")
world:enableSystem(gridSystem, "draw")

return world

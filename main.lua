love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";lib/?.lua;lib;")
-- Global vars
DEBUG = false
CONSTANTS = nil
COMPONENTS = nil
ENTITIES = nil
SYSTEMS = nil

-- Libraries
ECS = nil
STI = nil
Component = nil
Entity = nil
Instance = nil
System = nil
Vector = nil
Timer = nil
Camera = nil

local cam = nil

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    CONSTANTS = require("src.constants")
    Util = require("lib.util")
    assets = require("lib.cargo").init("asset")
    anim8 = require("lib.anim8")
    STI = require("lib.sti")
    ECS =
        require("lib.concord").init(
        {
            useEvents = false
        }
    )
    Component = require("lib.concord.component")
    Entity = require("lib.concord.entity")
    Instance = require("lib.concord.instance")
    System = require("lib.concord.system")
    Vector = require("lib.vector")
    Camera = require("lib.camera")
    Timer = require("lib.timer")

    LOGIC = require("src.logic")
    COMPONENTS = require("src.component")
    ENTITIES = require("src.entity")
    SYSTEMS = require("src.system")
    INSTANCES = require("src.instance")
    INSTANCES.world:emit("loadStage", "stage/test1.lua")
    testRocks() -- TODO: remove
    testBoulders() -- TODO: remove
    cam = Camera(CONSTANTS.COLUMNS * CONSTANTS.CELL_WIDTH / 2, CONSTANTS.ROWS * CONSTANTS.CELL_HEIGHT / 2)
end

function testRocks()
    for i = 0, 15 do
        local rand_x = math.random(CONSTANTS.COLUMNS)
        local rand_y = math.random(CONSTANTS.ROWS)

        INSTANCES.world:addEntity(ENTITIES.rock(rand_x, rand_y))
    end
end

function testBoulders()
    for i = 0, 7 do
        local rand_x = math.random(CONSTANTS.COLUMNS)
        local rand_y = math.random(CONSTANTS.ROWS)

        INSTANCES.world:addEntity(ENTITIES.boulder(rand_x, rand_y))
    end
    INSTANCES.world:addEntity(ENTITIES.switch(0, 5))
end

function love.update(dt)
    INSTANCES.world:emit("update", dt)
    Timer.update(dt)
end

function love.draw()
    cam:attach()

    INSTANCES.world:emit("draw")

    cam:detach()
end

function love.keyreleased(key)
    INSTANCES.world:emit("keyreleased", key)
end

function love.keypressed(key)
    if key == "f1" then
        DEBUG = not DEBUG
    elseif key == "escape" then
        love.event.quit()
    elseif key == "space" then
        love.event.quit("restart")
    end
    INSTANCES.world:emit("keypressed", key)
end

love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";lib/?.lua;lib;")
-- Global vars
DEBUG = false
CONSTANTS = nil
COMPONENTS = nil
ENTITIES = nil
SYSTEMS = nil
WORLD_OFFSET = nil

-- Libraries
ECS = nil
STI = nil
Component = nil
Entity = nil
Instance = nil
System = nil
Vector = nil
Timer = nil

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
    Timer = require("lib.timer")

    WORLD_OFFSET = Vector(0, 0)
    LOGIC = require("src.logic")
    COMPONENTS = require("src.component")
    ENTITIES = require("src.entity")
    SYSTEMS = require("src.system")
    INSTANCES = require("src.instance")
    INSTANCES.world:emit("nextStage")
end

function love.update(dt)
    INSTANCES.world:emit("update", dt)
    Timer.update(dt)
end

function love.draw()
    INSTANCES.world:emit("draw")
    love.graphics.print("[SPACE] - Restart Level")
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
        INSTANCES.world:emit("restartStage")
    end
    INSTANCES.world:emit("keypressed", key)
end

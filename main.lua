love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib;")
-- Global vars
DEBUG = false
CONSTANTS = nil
COMPONENTS = nil
ENTITIES = nil
SYSTEMS = nil

-- Libraries
ECS = nil
Component = nil
Entity = nil
Instance = nil
System = nil
Vector = nil
Timer = nil
Camera = nil


function love.load()
    Util = require('lib.util')
    ECS = require('lib.concord').init({
        useEvents = false,
      })
    Component = require('lib.concord.component')
    Entity = require('lib.concord.entity')
    Instance = require('lib.concord.instance')
    System = require('lib.concord.system')
    Vector = require('lib.vector')
    Camera = require('lib.camera')
    Timer = require('lib.timer')

    COMPONENTS = require('src.component')
    ENTITIES = require('src.entity')
    SYSTEMS = require('src.system')
    INSTANCES = require('src.instance')
    CONSTANTS = require('src.constants')
end

function love.update(dt)
end

function love.draw()
    love.graphics.print('grim')
end

function love.keypressed(key)
    if key == "f1" then
        DEBUG = not DEBUG
    elseif key == "escape" then
        love.event.quit()
    elseif key == "space" then
        love.event.quit('restart')
    end
end
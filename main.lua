love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib;")
DEBUG = false
CONSTANTS = nil

ECS = nil
Vector = nil

function love.load()
    ECS = require('lib.concord').init() -- TODO: actually use it / setup an instance
    Vector = require('lib.vector')
    Camera = require('lib.camera')
    Timer = require('lib.timer')
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

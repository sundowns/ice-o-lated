love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib;")
DEBUG = false
CONSTANTS = nil

-- globals r bad do we have to
Concord = require('lib.concord').init() -- TODO: actually use it / setup an instance

function love.load()
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

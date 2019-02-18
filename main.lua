_SCORES = {}

function love.load()
    GamestateManager = require("lib.gamestate")
    require("victory")
    require("game")
    love.window.setIcon(love.image.newImageData("asset/icon.png"))
    GamestateManager.registerEvents()
    GamestateManager.switch(game)
end

function love.update(dt)
end

function love.draw()
end

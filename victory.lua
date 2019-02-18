victory = {}

local thanks = nil
local winna = nil

local bigFont = nil
local normalFont = nil

function victory:init()
    bigFont = love.graphics.newFont("asset/Coiny-Regular.ttf", 100)
    normalFont = love.graphics.newFont("asset/Coiny-Regular.ttf", 36)

    thanks = love.graphics.newText(normalFont, "Thanks for playing!")
    winna = love.graphics.newText(bigFont, "V I C T O R Y")
end

function victory:draw()
    love.graphics.setColor(0, 1, 0.8, 1)
    love.graphics.draw(winna, love.graphics.getWidth() / 2 - winna:getWidth() / 2, love.graphics:getHeight() / 5)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(thanks, love.graphics.getWidth() / 2 - thanks:getWidth() / 2, love.graphics:getHeight() / 3)
end

function victory:update(dt)
end

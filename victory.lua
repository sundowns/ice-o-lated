victory = {}

local thanks = nil
local winna = nil
local quit = nil
local results = nil

local bigFont = nil
local normalFont = nil
local smallFont = nil

function victory:init()
    bigFont = love.graphics.newFont("asset/Coiny-Regular.ttf", 100)
    normalFont = love.graphics.newFont("asset/Coiny-Regular.ttf", 36)
    smallFont = love.graphics.newFont("asset/Coiny-Regular.ttf", 18)

    thanks = love.graphics.newText(normalFont, "Thanks for playing!")
    winna = love.graphics.newText(bigFont, "V I C T O R Y")
    quit = love.graphics.newText(smallFont, "Press [SPACE] to quit")
    results = love.graphics.newText(normalFont, "Results")
end

function victory:draw()
    love.graphics.setColor(0, 1, 0.8, 1)
    love.graphics.draw(winna, love.graphics.getWidth() / 2 - winna:getWidth() / 2, love.graphics:getHeight() * 0.05)

    love.graphics.draw(thanks, love.graphics.getWidth() / 2 - thanks:getWidth() / 2, love.graphics:getHeight() * 0.2)
    love.graphics.setColor(1, 1, 1)
    local x = love.graphics.getWidth() / 2 - results:getWidth() / 2
    local y = love.graphics.getHeight() * 0.3
    love.graphics.setFont(normalFont)
    love.graphics.draw(results, x, y)
    y = y + 50
    love.graphics.setFont(smallFont)
    for i, v in ipairs(_SCORES) do
        love.graphics.print("Level #" .. v.level .. " - " .. v.moves .. " moves", x, y)
        y = y + 32
    end

    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.draw(quit, love.graphics.getWidth() / 2 - quit:getWidth() / 2, love.graphics:getHeight() - 50)
end

function victory:update(dt)
end

function victory:keyreleased(key)
    if key == "space" then
        love.event.quit()
    end
end

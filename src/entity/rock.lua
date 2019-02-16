local rockImg = love.graphics.newImage("asset/obstacle.png")

local rock = Entity():give(COMPONENTS.sprite, rockImg):give(COMPONENTS.position):apply()

return rock

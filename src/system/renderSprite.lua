local renderSprite = System({COMPONENTS.sprite, COMPONENTS.position})

function renderSprite:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local sprite = e:get(COMPONENTS.sprite).sprite
        local pos = e:get(COMPONENTS.position).pos
        local color = {1, 0, 0, 1}
        --if e:has(COMPONENTS.color).color then
        --    color = e:get(COMPONENTS.color).color
        --end

        love.graphics.setColor(color)
        love.graphics.draw(sprite, pos.x, pos.y)
    end
end

return renderSprite

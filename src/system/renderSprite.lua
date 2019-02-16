local renderSprite = System({COMPONENTS.sprite, COMPONENTS.position})

function renderSprite:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local img = e:get(COMPONENTS.sprite)
        local pos = e:get(COMPONENTS.position).pos

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(img.sprite, pos.x, pos.y, img.rot, img.sx, img.sy)
    end
end

return renderSprite

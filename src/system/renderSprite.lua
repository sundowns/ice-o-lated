local renderSprite = System({COMPONENTS.sprite, COMPONENTS.position})

function renderSprite:draw()
    local e
    for i = 1, self.pool.size do
        e = self.pool:get(i)
        local img = e:get(COMPONENTS.sprite)
        local pos = e:get(COMPONENTS.position).pos

        if img.visible then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(img.sprite, WORLD_OFFSET.x + pos.x, WORLD_OFFSET.y + pos.y, img.rot, img.sx, img.sy)
        end
    end
end

return renderSprite

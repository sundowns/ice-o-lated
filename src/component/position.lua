local position =
	Component(
	function(e, x, y)
		e.pos = Vector(x, y or 0)
	end
)

-- moves across a grid cell
function position:translate(dx, dy)
	self.x = self.x + dx
	self.y = self.y + dy
end

return position

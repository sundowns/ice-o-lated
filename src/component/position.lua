local position = Component(function(e ,x,y)
	e.pos = Vector(x,y or 0)
end)

return position
extends CollisionPolygon2D

func _draw() -> void:
	for i in range(polygon.size()):
		var j = i + 1
		
		if j == polygon.size():
			j = 0
		
		draw_line(polygon[i], polygon[j], Color.hex(0x3d365cFF), 2)

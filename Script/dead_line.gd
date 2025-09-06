extends Area2D

@onready var coll = $CollisionShape2D

func _process(_delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	draw_line(to_local(coll.shape.a), to_local(coll.shape.b), Color.RED)

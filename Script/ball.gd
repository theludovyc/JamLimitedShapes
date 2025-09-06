extends RigidBody2D

@onready var coll = $CollisionShape2D

var radius = 0

var evolve = false

func set_radius(i:float):
	radius = i
	
	var final_scale = 1 + 0.5 * radius
	
	coll.scale = Vector2(final_scale, final_scale)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Ball"):
		if body.radius == radius and radius < 8:
			set_radius(radius + 1)
		
			body.queue_free()

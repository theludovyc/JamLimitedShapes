extends Area2D

signal stillInCollisionWithBall

@onready var coll = $CollisionShape2D
@onready var timer = $Timer

func _process(_delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	draw_line(to_local(coll.shape.a), to_local(coll.shape.b), Color.RED)

func _on_body_entered(body: Node2D) -> void:
	if timer.is_stopped() and body.is_in_group("Ball"):
		timer.start()

func _on_timer_timeout() -> void:
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.is_in_group("Ball"):
				stillInCollisionWithBall.emit()
				return

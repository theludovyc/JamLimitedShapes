extends Node2D

@export var Balls : Node2D

const Speed = 100

var Ball = preload("res://scene/ball.tscn")

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(), "progress_ratio", 1, 2)
	tween.chain().tween_property(get_parent(), "progress_ratio", 0, 2)
	tween.set_loops()

func _process(delta: float) -> void:
	var dir = Input.get_axis("ui_left", "ui_right")
	
	position.x += dir * Speed * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		var ball:Node2D = Ball.instantiate()
		
		ball.position = global_position
		
		Balls.add_child(ball)
		
		ball.set_radius(randi_range(0, 3))

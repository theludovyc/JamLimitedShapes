extends Node2D
class_name Spawner

@export var Balls : Node2D

var Ball = preload("res://scene/ball.tscn")

var ball : Node2D

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(), "progress_ratio", 1, 2)
	tween.chain().tween_property(get_parent(), "progress_ratio", 0, 2)
	tween.set_loops()

func spawn_ball(radius:int):
	ball = Ball.instantiate()
	
	add_child(ball)
	
	ball.set_radius(radius)

func release_ball():
	remove_child(ball)
		
	ball.position = global_position
	
	ball.connect("evolved", get_tree().current_scene._on_ball_evolved)
	
	Balls.add_child(ball)
	
	ball.process_mode = Node.PROCESS_MODE_INHERIT

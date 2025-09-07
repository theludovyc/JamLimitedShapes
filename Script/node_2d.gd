extends Node2D

@export var Balls : Node2D

@export var colors_grad : GradientTexture1D

@onready var timer : Timer = $Timer

const Speed = 100

var Ball = preload("res://scene/ball.tscn")

var next_radius : int

var ball : Node2D

func spawn_ball():
	ball = Ball.instantiate()
	
	add_child(ball)
	
	ball.set_radius(next_radius)

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(get_parent(), "progress_ratio", 1, 2)
	tween.chain().tween_property(get_parent(), "progress_ratio", 0, 2)
	tween.set_loops()
	
	next_radius = randi_range(0, 3)
	
	spawn_ball()

func _process(delta: float) -> void:
	if timer.is_stopped() and Input.is_action_just_pressed("ui_accept"):
		remove_child(ball)
		
		ball.position = global_position
		
		ball.connect("evolved", get_tree().current_scene._on_ball_evolved)
		
		Balls.add_child(ball)
		
		ball.process_mode = Node.PROCESS_MODE_INHERIT
		
		next_radius = randi_range(0, 3)
	
		timer.start()

func _on_timer_timeout() -> void:
	spawn_ball()

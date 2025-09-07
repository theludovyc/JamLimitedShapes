extends Node

@onready var ui:UI = $UI
@onready var spawner:Spawner = %Spawner
@onready var spawnTimer:Timer = $SpawnTimer

var score := 0

var next_radius : int

var gameOver := false

func _ready() -> void:
	next_radius = randi_range(0, 3)
	
	spawner.spawn_ball(next_radius)
	
func _process(_delta: float) -> void:
	if not gameOver and spawnTimer.is_stopped() and Input.is_action_just_pressed("ui_accept"):
		spawner.release_ball()
		
		spawnTimer.start()

func _on_dead_line_still_in_collision_with_ball() -> void:
	gameOver = true
	
	ui.setGameOver(true)

func _on_retry_button_button_down() -> void:
	get_tree().reload_current_scene()
	
func _on_ball_evolved(radius:int) -> void:
	score += radius
	
	ui.setScore(score)

func _on_spawn_timer_timeout() -> void:
	if gameOver:
		return
	
	next_radius = randi_range(0, 3)
	
	spawner.spawn_ball(next_radius)

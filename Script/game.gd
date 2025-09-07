extends Node

@onready var ui:UI = $UI

var score := 0

func _on_dead_line_still_in_collision_with_ball() -> void:
	ui.setGameOver(true)

func _on_retry_button_button_down() -> void:
	get_tree().reload_current_scene()
	
func _on_ball_evolved(radius:int) -> void:
	score += radius
	
	ui.setScore(score)

extends Node

@onready var ui:UI = $UI

func _on_dead_line_still_in_collision_with_ball() -> void:
	ui.setGameOver(true)

func _on_retry_button_button_down() -> void:
	get_tree().reload_current_scene()

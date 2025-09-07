extends Node

@onready var ui = $UI

func _on_dead_line_still_in_collision_with_ball() -> void:
	prints(name, "Game over")

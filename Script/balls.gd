extends Node2D

@export var colors_grad : GradientTexture1D

var colors = PackedColorArray()

func _ready() -> void:
	colors.append(Color.RED)
	colors.append(Color.BLUE)
	colors.append(Color.GREEN)
	colors.append(Color.PURPLE)
	colors.append(Color.DARK_ORANGE)

func _process(_delta: float) -> void:
	queue_redraw()

func _draw():
	for ball in get_children():
		draw_circle(ball.position, 10 * (1 + ball.radius * 0.25),
		colors_grad.gradient.sample(remap(ball.radius, 0, 8, 0, 1)))

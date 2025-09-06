extends RigidBody2D

@export var colors_grad : GradientTexture1D

@onready var coll = $CollisionShape2D

var radius = 0

var evolve = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func set_radius(i:float):
	radius = i
	
	var final_scale = 1 + 0.5 * radius
	
	coll.scale = Vector2(final_scale, final_scale)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Ball") and \
	not freeze and not body.freeze and \
	body.radius == radius and radius < 8:
		set_radius(radius + 1)
	
		body.queue_free()

func _process(_delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	draw_circle(to_local(global_position), coll.shape.radius * coll.scale.x,
	colors_grad.gradient.sample(remap(radius, 0, 8, 0, 1)))

extends Node2D

@export var trap_scene: PackedScene
@export var spawn_interval: float = 2.0
@export var max_traps: int = 5

var current_traps: Array = []
var spawn_cooldown: float = 0.0
@onready var camera: Camera2D = get_viewport().get_camera_2d()

func _process(delta: float) -> void:
	if spawn_cooldown > 0:
		spawn_cooldown -= delta
	else:
		_spawn_trap()

func _spawn_trap():
	if current_traps.size() >= max_traps:
		return

	spawn_cooldown = spawn_interval  # Reset cooldown

	# Ensure camera exists
	if camera:
		var viewport_size = Vector2(get_viewport().size)
		var camera_position = camera.global_position
		var camera_zoom = camera.zoom
		var half_viewport = (viewport_size * camera_zoom) / 2

		# Calculate visible area
		var visible_rect_position = camera_position - half_viewport
		var visible_rect_size = viewport_size * camera_zoom

		# Spawn trap at a random x-position within the visible area
		var random_x = randf_range(visible_rect_position.x, visible_rect_position.x + visible_rect_size.x)
		var trap = trap_scene.instantiate()
		trap.global_position = Vector2(random_x, 600)  # Fixed y-position

		add_child(trap)
		current_traps.append(trap)

		# Proper signal connection in Godot 4
		trap.tree_exited.connect(func(): _on_trap_removed(trap))

func _on_trap_removed(trap):
	current_traps.erase(trap)  # Remove trap from list when it exits

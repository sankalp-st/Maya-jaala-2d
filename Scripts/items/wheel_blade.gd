extends AnimatedSprite2D

@export var speed: float = 100.0  # Speed of the trap
@export var chase_distance: float = 300.0  # Distance at which the trap starts chasing
var is_chasing: bool = false  # Whether the trap is chasing the player
@onready var despawn_timer: Timer = $Timer  # Timer to handle despawning
@onready var player: Player = $"../Player"



func _ready():
	if not player:
		visible = false
		print("Error: Player node not found!")
		return


func _process(delta: float):
	# Check if the player is valid
	if not is_instance_valid(player):
		visible = false
		is_chasing = false
		return

	# Check if the enemy's health is below 10
	if GlobalVar.enemy1_health < 10:
		_start_chasing()

	if is_chasing:
		_chase_player(delta)

func _start_chasing():
	visible = true
	# Start chasing the player
	if not is_chasing:
		is_chasing = true

		# Start the despawn timer
		despawn_timer.start()  # 5 seconds

func _chase_player(delta: float):
	# Check if the player is valid
	if not is_instance_valid(player):
		visible = false
		is_chasing = false
		return

	# Calculate the direction to the player
	var direction = (player.global_position - global_position).normalized()

	# Move the trap towards the player
	global_position += direction * speed * delta

	# Flip the sprite based on movement direction
	if direction.x > 0:
		flip_h = false  # Face right
	else:
		flip_h = true  # Face left

func _on_timer_timeout() -> void:
	print("Trap despawned!")
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		GlobalVar.player_health -= 1

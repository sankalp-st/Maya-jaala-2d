class_name Player_die
extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: Player = $"../.."
@onready var death_player_: AudioStreamPlayer = $"../../Audio/death(player)"


func enter() -> void:
	death_player_.play()
	print("die state")
	animation_player.play("knock_down")
	
func exit() -> void:
	pass

func Update(delta: float) -> State:
	return null
	
func Input_Update(event : InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	return null
	
func remove():
	player.queue_free()

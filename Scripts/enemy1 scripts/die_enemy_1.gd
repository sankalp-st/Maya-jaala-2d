class_name die_enemy1
extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var enemy_1: Enemy = $"../.."


func enter() -> void:
	animation_player.play("enemy_die")

	
func exit() -> void:
	pass

func Update(delta: float) -> State:
	return null
	
func Input_Update(event : InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	return null
	
func death():
	enemy_1.queue_free()
	

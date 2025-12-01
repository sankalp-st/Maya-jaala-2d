extends State
class_name player_Attack_2

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: Player = $"../.."
@onready var hitbox: CollisionShape2D = $"../../AnimatedSprite2D/hitbox/CollisionShape2D"
@onready var doupunch: AudioStreamPlayer = $"../../Audio/doupunch"


@export var attack : bool = false
@export var attack2 : bool = false

func enter() -> void:
	doupunch.play()
	if player.die_player:
		Transitioned.emit(self,"die")
	animation_player.play("dou_punch")
	player.can_input_var = false
	attack = true
	null
	
func exit() -> void:
	attack = false
	hitbox.disabled = true

func Update(delta: float) -> State:
	return null
	
	
func Input_Update(event : InputEvent) -> State:
	if(Input.is_action_pressed("Movement")):
		Transitioned.emit(self,"movement")
	if(Input.is_action_just_pressed("Kick") and animation_player.is_playing() == false):
		Transitioned.emit(self,"kick")
	return null

func Physics_Update(delta: float) -> State:
	if attack == false :
		Transitioned.emit(self,"idel")
	return null

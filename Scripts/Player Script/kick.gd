extends State
class_name player_Kick

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: Player = $"../.."
@export var attack : bool
@onready var hitbox: CollisionShape2D = $"../../AnimatedSprite2D/hitbox/CollisionShape2D"
@onready var kick: AudioStreamPlayer = $"../../Audio/kick"


func enter() -> void:
	kick.play()
	if player.die_player:
		Transitioned.emit(self,"die")
	#print("Kick state")
	attack = true
	player.can_input_var = true
	if !player.die_player:
		if player.can_input_var:
			animation_player.play("dou_kick")
	else:
		Transitioned.emit(self,"die")
	player.can_input_var = false
	null
	
func exit() -> void:
	hitbox.disabled = true
	null

func Update(delta: float) -> State:
	return null

func Input_Update(event : InputEvent) -> State:
	if(Input.is_action_pressed("Movement")):
		Transitioned.emit(self,"movement")
	if(Input.is_action_just_pressed("Attack") && animation_player.is_playing() == false):
		Transitioned.emit(self,"singlePunch")
	return null

func Physics_Update(delta: float) -> State:
	if attack == false :
		Transitioned.emit(self,"idel")
	return null
	
func takedamage():
	GlobalVar.enemy1_health -= 0.5
	GlobalVar.enemy1_health = clamp(GlobalVar.enemy1_health, 0,20)
	GlobalVar.chasespeed += 10
	print(GlobalVar.chasespeed)
	print(GlobalVar.enemy1_health)


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("HurtBox"):
		takedamage()

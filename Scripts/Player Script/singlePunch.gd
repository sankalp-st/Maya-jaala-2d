extends State
class_name player_Attack_1

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var player: Player = $"../.."
@onready var movement: player_movement = $"../movement"
@onready var hitbox: CollisionShape2D = $"../../AnimatedSprite2D/hitbox/CollisionShape2D"
@onready var hurt_enemy_: AudioStreamPlayer = $"../../Audio/hurt(enemy)"
@onready var punch: AudioStreamPlayer = $"../../Audio/punch"


@export var attack : bool
@export var attack2 : bool = false

func enter() -> void:
	punch.play()
	#print("single punch state")
	attack = true
	player.can_input_var = true
	if player.can_input_var && !player.die_player :
		animation_player.play("single_punch")
		GlobalVar.vulnerability = true
	elif player.die_player:
		Transitioned.emit(self,"die")
	player.can_input_var = false
	attack = true
	null
	
func exit() -> void:
	attack = false
	hitbox.disabled = true
	

func Update(delta: float) -> State:
	if attack2 and player.can_input_var :
		if(Input.is_action_pressed("Attack")):
			Transitioned.emit(self,"douPunch")
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


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("HurtBox"):
		takedamage()

func takedamage():
	if !hurt_enemy_.playing && GlobalVar.enemy1_health > 2 && GlobalVar.enemy1_health < 18 :
		hurt_enemy_.play()
	GlobalVar.enemy1_health = GlobalVar.enemy1_health - 1
	GlobalVar.enemy1_health = clamp(GlobalVar.enemy1_health, 0,20)
	GlobalVar.chasespeed += 10
	print(GlobalVar.chasespeed)
	print(GlobalVar.enemy1_health)
	
func enable_attack2():
	attack2 = true

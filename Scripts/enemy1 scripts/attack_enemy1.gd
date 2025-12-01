class_name attack
extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var ray_cast_left: RayCast2D = $"../../RayCastLeft"
@onready var ray_cast_right: RayCast2D = $"../../RayCastRight"
@onready var enemy_1: Enemy = $"../.."
@onready var run: Run_enemy1 = $"../Run"
@onready var idel: idel_enemy1 = $"../Idel"



var player: Player


func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")
	
	pass
	
func exit() -> void:
	pass

func Update(delta: float) -> State:
	if enemy_1.hurt == true && enemy_1.die == false :
		animation_player.play("enemy_hurt")
	elif enemy_1.hurt == false && enemy_1.die == false :
		if GlobalVar.enemy1_health < 10 :
			animation_player.play("enemy_attack")
		else:
			animation_player.play("enemy_attack")
	elif enemy_1.die == true :
		Transitioned.emit(self,"Die")
	if !(ray_cast_left.get_collider() == player or ray_cast_right.get_collider() == player):
		await animation_player.animation_finished
		Transitioned.emit(self,"Idel")
	return null
	
func Input_Update(event : InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	return null


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		takedamage()
		
func takedamage():
	GlobalVar.player_health -= 1
	#idel.timer.wait_time = 0
	GlobalVar.player_health = clamp(GlobalVar.player_health, 0, 1)
	print(GlobalVar.player_health)
	#healthbar.health = GlobalVar.player_health

	

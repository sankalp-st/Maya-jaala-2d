extends CharacterBody2D
class_name Player

var can_input_var : bool = true
var previous_player_health = GlobalVar.player_health
var hurt_player : bool 
var die_player : bool
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
var health_max = GlobalVar.enemy1_health
var health_min = 0
var health : int


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()

func ready_for_input():
	can_input_var = true
	
func _process(delta: float) -> void:
	health = GlobalVar.enemy1_health
	GlobalVar.player_health = clamp(GlobalVar.player_health, 0, 1)
	if GlobalVar.player_health < previous_player_health:
		hurt_player = true
		animation_player_2.play("player_hurt")
		previous_player_health = GlobalVar.player_health
	elif GlobalVar.player_health == 0 :
		die_player = true

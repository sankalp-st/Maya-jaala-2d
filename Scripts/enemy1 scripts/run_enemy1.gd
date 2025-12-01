class_name Run_enemy1
extends State

var enemy_chase: bool = false
var dir: int = 1
var speed: float = 5000
var velocity: Vector2 = Vector2.ZERO
#var chasespeed: float = 150

@onready var ray_cast_left: RayCast2D = $"../../RayCastLeft"
@onready var ray_cast_right: RayCast2D = $"../../RayCastRight"
@onready var ray_cast_left_long: RayCast2D = $"../../RayCastLeftLong"
@onready var ray_cast_right_long: RayCast2D = $"../../RayCastRightLong"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"
@onready var hitbox: CollisionShape2D = $"../../Sprite2D/Hitbox/CollisionShape2D"
@onready var ray_cast_left_2: RayCast2D = $"../../RayCastLeft2"


@export var enemy: Enemy
var player: Player

func enter() -> void:
	player = get_tree().get_first_node_in_group("Player")

func exit() -> void:
	pass

func Update(delta: float) -> State:
	animation()
	change_direction()
	look_for_player()
	attack_state()
	hitbox_dir()
	return null

func Input_Update(event: InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	if enemy:
		if !enemy_chase:
			enemy.velocity.x = dir * speed * delta
		else:
			chase_player()
		enemy.move_and_slide()
	return null

func change_direction() -> void:
	if !enemy_chase:
		if ray_cast_left.is_colliding():
			dir = 1
			sprite_2d.flip_h = false
		elif ray_cast_right.is_colliding():
			dir = -1
			sprite_2d.flip_h = true

func animation() -> void:
	if enemy.velocity.x != 0:
		animation_player.play("Enemy_run")

func look_for_player() -> void:
	if !enemy_chase:
		if ray_cast_left_long.is_colliding() and ray_cast_left_long.get_collider() == player:
			start_chase()
		elif ray_cast_right_long.is_colliding() and ray_cast_right_long.get_collider() == player:
			start_chase()

		

func start_chase() -> void:
	enemy_chase = true
	#speed = 10000
	sprite_2d.flip_h = player.position.x < enemy.position.x

func chase_player() -> void:
	if player:
		var direction_to_player = enemy.position.direction_to(player.position)
		enemy.velocity.x = direction_to_player.x * GlobalVar.chasespeed
		sprite_2d.flip_h = direction_to_player.x < 0
	
func attack_state():
	if (ray_cast_left_2.get_collider() == player or ray_cast_left.get_collider() == player  or ray_cast_right.get_collider() == player):
		Transitioned.emit(self,"Attack")
		
func hitbox_dir():
	if sprite_2d.flip_h:
		hitbox.position.x = abs(hitbox.position.x) * -1
	else:
		hitbox.position.x = abs(hitbox.position.x)

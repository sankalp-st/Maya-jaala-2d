extends  State
class_name player_movement

@export var player: Player 
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var hitbox: CollisionShape2D = $"../../AnimatedSprite2D/hitbox/CollisionShape2D"
@onready var running: AudioStreamPlayer = $"../../Audio/running"
@onready var jump: AudioStreamPlayer = $"../../Audio/jump"



var Speed = 300
var JUMP_VELOCITY = -400.0
var velocity = Vector2.ZERO


func enter():
	if player.die_player:
		Transitioned.emit(self,"die")
	#print("move state")
	null


func Physics_Update(delta: float) -> State:
	var direction := Input.get_axis("Left", "Right")
	Run(delta)
	Jump()
	Direction(direction)
	Animations(direction)
	sound(direction)
	player.move_and_slide()
	
	
	return null
	
func exit():
	null
	
func Run(delta : float):
	var direction := Input.get_axis("Left", "Right")
	if direction :
		player.velocity.x = direction * Speed
	else:
		player.velocity.x = move_toward(velocity.x, 0, Speed * delta)
		
func Jump():
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
		jump.play()
		
	
func Direction(direction):
	if (direction == -1):
		animated_sprite_2d.flip_h = true
		hitbox.position.x = abs(hitbox.position.x) * -1 
		
	elif (direction == 1):
		animated_sprite_2d.flip_h = false
		hitbox.position.x = abs(hitbox.position.x) 
	
func Animations(direction):
	if !player.die_player:
		if player.is_on_floor():
			if direction == 0 and animated_sprite_2d.animation != "player_idel":
				animation_player.play("idel_player")
			elif direction != 0 and animated_sprite_2d.animation != "player_run":
				animation_player.play("walk")
		elif not player.is_on_floor():
			if player.velocity.y < 0 and animated_sprite_2d.animation != "player_jump":
				animation_player.play("jump")
			elif player.velocity.y >= 0 and animated_sprite_2d.animation != "player_inair":
				animation_player.play("fall")
	else:
		Transitioned.emit(self,"die")
			
func Input_Update(event : InputEvent) -> State:
	if(Input.is_action_pressed("Attack") && player.velocity == Vector2.ZERO):
		Transitioned.emit(self,"singlePunch")
	if(Input.is_action_just_pressed("Kick") && player.velocity == Vector2.ZERO):
		Transitioned.emit(self,"kick")
	return null
	
func Update(delta: float) -> State:
	return null
	
func sound(direction):
	null

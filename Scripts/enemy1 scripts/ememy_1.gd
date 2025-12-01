extends CharacterBody2D
class_name Enemy

var health_max = GlobalVar.player_health
var health: int
var previous_health: int  # Store the last health value
var hurt: bool = false
var die: bool = false
var health_min = 0
var stop_animation = false
var has_size_increased: bool = false


@onready var intro_enemy_: AudioStreamPlayer = $"Audio/intro(enemy)"
@onready var death_enemy_: AudioStreamPlayer = $"Audio/death(enemy)"
@onready var low_health: AudioStreamPlayer = $Audio/low_health


@onready var animation_player = $AnimationPlayer
@onready var run: Run_enemy1 = $Enemy_stateMachine/Run
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

func _ready():
	health = health_max  
	previous_health = health  # Initialize previous health

func _process(delta: float) -> void:
	audio()
	previous_health = health  # Store the old health before updating
	health = GlobalVar.enemy1_health  # Sync current health with global variable

	if health < previous_health:  # Check if health decreased
		_hurt()

	if health <= health_min and not die:
		_die()
		
	if health < 11 and not has_size_increased: 
		low_health.play()
		GlobalVar.chasespeed = 600
		size_inc()
		has_size_increased = true  # Mark the animation as played

func _hurt():
	if not hurt:
		hurt = true
		animation_player.play("enemy_hurt")
		await animation_player.animation_finished
		hurt = false

func _die():
	if not die:
		die = true
		death_enemy_.play()
		animation_player.play("enemy_die")
		print("Enemy is dead!")
		await animation_player.animation_finished
		queue_free()
		
func size_grown_func():
	stop_animation = true
	
func size_inc():
	if stop_animation == false:
		animation_player_2.play("size_inc")
		
func audio():
	if !run.enemy_chase :
		intro_enemy_.play()
	

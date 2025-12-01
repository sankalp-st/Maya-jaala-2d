extends State
class_name Player_idel

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@export var PlayerCommon : Node
@onready var player: CharacterBody2D = $"../.."
@onready var timer: Timer = $"../Timer"

func enter() -> void:
	#print("idel state")
	animation_player.play("idel_player")
	GlobalVar.vulnerability = true
	timer.start()
	
	
func exit() -> void:
	
	null

func Update(delta: float) -> State:
	if player.die_player == true :
		Transitioned.emit(self,"die")
	return null

	
func Input_Update(event : InputEvent) -> State:
	if !GlobalVar.vulnerability:
		if(Input.is_action_pressed("Attack")):
			Transitioned.emit(self,"singlePunch")
		if(Input.is_action_just_pressed("Kick")):
			Transitioned.emit(self,"kick")
	if(Input.is_action_pressed("Movement")):
		Transitioned.emit(self,"movement")
	return null

func Physics_Update(delta: float) -> State:
	return null


func _on_timer_timeout() -> void:
	GlobalVar.vulnerability = false
	#print(GlobalVar.vulnerability)

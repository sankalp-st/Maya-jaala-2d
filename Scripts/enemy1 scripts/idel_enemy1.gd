class_name idel_enemy1
extends State

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var timer: Timer = $"../../Timer"


func enter() -> void:
	timerfunc()
	animation_player.play("Enemy_idel")
	
func exit() -> void:
	pass

func Update(delta: float) -> State:
	if GlobalVar.enemy1_health < 10 :
		Transitioned.emit(self,"Run")
	return null
	
func Input_Update(event : InputEvent) -> State:
	return null

func Physics_Update(delta: float) -> State:
	return null
	
func timerfunc():
	timer.start()

func _on_timer_timeout() -> void:
	Transitioned.emit(self,"Run")

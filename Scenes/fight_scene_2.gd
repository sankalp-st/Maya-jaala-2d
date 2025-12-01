extends Node2D

@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
var change : bool

func _process(delta: float) -> void:
	if GlobalVar.player_health == 0 :
		animation_player.play("player_death")
		if change :
			get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")
	if GlobalVar.enemy1_health == 0 :
		animation_player.play("enemy_death")
		if change :
			get_tree().change_scene_to_file("res://Scenes/Main_menu.tscn")
		
		
func change_screen():
	change = true

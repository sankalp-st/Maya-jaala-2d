extends Control

func _on_start_pressed() -> void:
	GlobalVar.player_health = 1
	GlobalVar.enemy1_health = 20
	get_tree().change_scene_to_file("res://Scenes/fight_scene_2.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

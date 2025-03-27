extends Node2D

func _process(_delta):
	$Camera2D.position.x = $Mario.position.x 
	
	if Global.PlayerHp <= 0:
		Global.PlayerHp = 3
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")   

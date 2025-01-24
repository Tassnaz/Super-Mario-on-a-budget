extends Area2D

@export var NextLevel = ""

func _on_body_entered(body: CharacterBody2D):
	
	if body.name == "Mario" and Global.TotalCoins == 10:
		get_tree().change_scene_to_file(NextLevel)

extends Area2D

@export var NextLevel = ""

func _on_body_entered(body: CharacterBody2D):
	
	if body.name == "Mario":
		get_tree().change_scene_to_file(NextLevel)
		Global.TotalCoins = 0

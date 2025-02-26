extends Area2D



func _on_body_entered(body):
	if body.name == "Mario":
		Global.PlayerHp -= 1
		get_tree().reload_current_scene()
		Global.TotalCoins = 0
	
	elif Global.PlayerHp <= 0 and body.name == "Mario":
		Global.PlayerHp = 3
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")


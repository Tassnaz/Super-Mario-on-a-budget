extends Area2D


func _on_body_entered(body):
	if body.name == "Mario":
		Global.PlayerHp -= 1
		get_tree().reload_current_scene()
		Global.TotalCoins = 0
	

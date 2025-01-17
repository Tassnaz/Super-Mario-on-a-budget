extends Area2D




func _on_body_entered(body):
	if body.name == "Mario":
		
		Global.TotalCoins += 1
		$AnimationPlayer.play("Pickup")
		

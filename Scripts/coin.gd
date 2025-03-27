extends Area2D


func _on_body_entered(body):
	if body.name == "Mario":
		
		Global.TotalCoins += 1
		visible = false
		$CollisionShape2D.queue_free()
		$AudioStreamPlayer2D.play(0.1)
		await get_tree().create_timer(1).timeout
		queue_free()
		

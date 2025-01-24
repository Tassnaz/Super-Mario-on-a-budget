extends Label



func _physics_process(delta):
	text = "Lives: " + str(Global.PlayerHp)

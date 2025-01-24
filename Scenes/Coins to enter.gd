extends Label

func _physics_process(delta):
	text = str(Global.TotalCoins) + "/" + "10 " + "Coins"


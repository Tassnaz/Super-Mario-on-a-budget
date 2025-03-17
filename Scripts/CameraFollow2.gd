extends Node2D


func _process(_delta):
	$Camera2D.position.x = $Mario.position.x     
	
	if $Mario.position.y < -165:
		$Camera2D.position.y = $Mario.position.y
		
	else:
		$Camera2D.position.y = -101

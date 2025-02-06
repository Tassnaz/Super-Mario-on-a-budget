extends CharacterBody2D

var Gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var  MaxFallSpeed = 200.0
@export var Speed = 150.0

var enemyStartPos = Vector2()
var MovingLeft = true
@export var MaxMoveDistance = 60

func _ready():
	enemyStartPos = position

func _physics_process(_delta):
	
	velocity.y += Gravity
	
	if velocity.y > MaxFallSpeed:
		velocity.y = MaxFallSpeed
		
	if MovingLeft == true:
		velocity.x = -Speed
		$Sprite2D.scale.x = -1
	else:
		velocity.x = Speed
		$Sprite2D.scale.x = 1
	
	if position.x >= enemyStartPos.x:
		MovingLeft = true
	elif position.x <= enemyStartPos.x - MaxMoveDistance:
		MovingLeft = false
	
	move_and_slide()


func _on_damage_hit_box_body_entered(body):
	if body.name == "Mario":
		queue_free()


func _on_attack_hit_box_body_entered(body):
	if body.name == "Mario":
		Global.KillSignal = true
		
	if Global.PlayerHp <= 0:
		get_tree().quit()

extends CharacterBody2D

var Gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var  MaxFallSpeed = 200
@export var Speed = 80

var enemyStartPos = Vector2()
var MovingLeft = true
@export var MaxMoveDistance = 0

func _ready():
	# Enemy start position
	enemyStartPos = position

func _physics_process(_delta):
	# Gravity
	velocity.y += Gravity
	
	if velocity.y > MaxFallSpeed:
		velocity.y = MaxFallSpeed
		
		
	if MovingLeft == true:
		velocity.x = -Speed
		$Sprite2D.scale.x = -1
		$AnimationPlayer.play("Sprinting")
		
	else:
		velocity.x = Speed
		$Sprite2D.scale.x = 1
		$AnimationPlayer.play("Sprinting")
	
	
	if position.x >= enemyStartPos.x:
		MovingLeft = true
	elif position.x <= enemyStartPos.x - MaxMoveDistance:
		MovingLeft = false
	
	move_and_slide()


func _on_damage_hit_box_body_entered(body):
	if body.name == "Mario":
		Global.JumpOnEnemy = true
		visible = false
		$CollisionShape2D.queue_free()
		$DeathSound.play(0)
		await get_tree().create_timer(0.38).timeout
		queue_free()



func _on_attack_hit_box_body_entered(body):
	if body.name == "Mario":
		Global.KillSignal = true
		
	elif Global.PlayerHp <= 0:
		Global.PlayerHp = 3
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")

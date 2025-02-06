extends CharacterBody2D

# Hämta globala inställningar för gravitation
var Gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var Speed = 150.0
@export var JumpForce = 350
@export var Accel = 10
@export var Friction = 0.1
var  MaxFallSpeed = 200.0

var PlayerStarPos = Vector2()

func _ready():
	PlayerStarPos = self.position
	
func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += Gravity * delta
	
	if velocity.y > MaxFallSpeed:
		velocity.y = MaxFallSpeed
	
	velocity.x = clamp(velocity.x, -Speed, Speed)
	
	# Move right/left
	if Input.is_action_pressed("Right"):
		velocity.x += Accel
		$Sprite2D.scale.x = 1
		
		$AnimationPlayer.play("Sprinting")
	
	elif Input.is_action_pressed("Left"):
		velocity.x -= Accel
		$Sprite2D.scale.x = -1
		
		$AnimationPlayer.play("Sprinting")
	
	else:
		
		$AnimationPlayer.stop()
		$Sprite2D.frame = 0
		
		velocity.x = lerp(velocity.x, 0.0, Friction)
	
	move_and_slide()
	
	
	# Jump
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y = -JumpForce
		$JumpSound.play(0.14)
	
	if not is_on_floor():
		$AnimationPlayer.stop()
		$Sprite2D.frame = 5
	
	
	# Respawn
	if Input.is_action_just_pressed("Respawn"):
		self.position = PlayerStarPos
		get_tree().reload_current_scene()
		Global.PlayerHp -= 1
		Global.TotalCoins = 0
		
	if Global.KillSignal == true:
		Global.KillSignal = false
		Global.PlayerHp -= 1
		get_tree().reload_current_scene()
		
		
	
	
	
	
	
	


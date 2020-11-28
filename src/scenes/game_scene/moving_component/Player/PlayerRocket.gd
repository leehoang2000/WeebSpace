extends KinematicBody2D

export var speed = 200
export var coin_speed_boost_count = 0


func _ready():
	pass 
	

func _physics_process(delta):
	# Get player input
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	# Apply movement
	var movement = speed * direction * delta
	
	# Prevent rotation when stop
	if movement.x != 0 or movement.y != 0 :
		rotation = direction.angle() + PI/2
	move_and_collide(movement)

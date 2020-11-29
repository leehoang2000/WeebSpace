extends KinematicBody2D

export var speed = 200
export var coin_speed_boost_count = 0

signal send_signal(blob)
var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')


func _ready():
	self.connect('send_signal', get_tree().root.get_node("/root/EventBus"), '_general_signal_handler')


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
	var collision = move_and_collide(movement)
	if collision != null:
		emit_signal('send_signal',  Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.PLAYER_DEAD, null))

func _handle_Game_End(blob):
	speed = 0

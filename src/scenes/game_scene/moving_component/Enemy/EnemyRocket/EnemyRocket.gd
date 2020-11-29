extends KinematicBody2D

signal send_signal(blob)
var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')

var player
export var speed = 60
var direction : Vector2
var blink_index = 0
var blink_count = 5


func blink(xnode, color_palete: Array)-> Color:
	var color = Color(color_palete[blink_index % len(color_palete)])
	xnode.modulate = color
	blink_index += 1
	return color


func _ready():
	player = get_tree().root.get_node("Root/PlayerRocket")
	self.connect("send_signal",get_tree().root.get_node("/root/EventBus"), "_general_signal_handler")
	emit_signal('send_signal', Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.ENEMY_BORN, null))
	
func _physics_process(delta):
	if speed == 0:
		return
	var movement = direction * speed * delta
	var collision = move_and_collide(movement)
	if collision != null:
		speed = 0
		get_node("UpdateTargetTimer").stop()
		get_node("AgingTimer").start()
		# Sprite dead color
		get_node("Sprite").modulate = Color("#321f28")
		sayGoodbye()

func _on_UpdateTargetTimer_timeout():
	if player != null:
		var player_relative_position = player.position - self.position
		direction = player_relative_position.normalized()


func _on_AgingTimer_timeout():
	get_node("EndingBlinkTimer").start()


func _on_EndingBlinkTimer_timeout():
	blink(get_node("Sprite"), ["#321f28", "#aa3a3a"])
	if blink_index == blink_count:
		recycle_able()
		
func sayGoodbye():
	emit_signal("send_signal", Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.ENEMY_DEAD, null))

func recycle_able():
	emit_signal("send_signal", Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.ENEMY_RECYCLE, null))
	
func immediate_destruction():
	sayGoodbye()
	recycle_able()
	
func _on_SpeedIncreaseTimer_timeout():
	# After some time, even faster
	speed = min(speed * 1.3 , player.speed - 1)
	get_node("SpeedIncreaseTimer").wait_time *= 1.3

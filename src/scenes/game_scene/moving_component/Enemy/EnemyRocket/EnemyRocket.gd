extends KinematicBody2D

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
		

func _on_UpdateTargetTimer_timeout():
	if player != null:
		var player_relative_position = player.position - self.position
		direction = player_relative_position.normalized()


func _on_AgingTimer_timeout():
	get_node("EndingBlinkTimer").start()


func _on_EndingBlinkTimer_timeout():
	blink(get_node("Sprite"), ["#321f28", "#aa3a3a"])
	if blink_index == blink_count:
		sayGoodbye()
		get_tree().queue_delete(self)
		
func sayGoodbye():
	pass


func _on_SpeedIncreaseTimer_timeout():
	# After some time, even faster
	speed = min(speed * 1.3 , player.speed - 1)
	get_node("SpeedIncreaseTimer").wait_time *= 1.3

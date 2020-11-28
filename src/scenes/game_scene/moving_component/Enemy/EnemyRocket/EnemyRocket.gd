extends KinematicBody2D

var player
export var speed = 60
var direction : Vector2

func _ready():
	player = get_tree().root.get_node("Root/PlayerRocket")
	
func _on_Timer_timeout():
	var player_relative_position = player.position - self.position
	direction = player_relative_position.normalized()
	
func _physics_process(delta):
	var movement = direction * speed * delta
	var collision = move_and_collide(movement)
	if collision != null:
		speed = 0

func arise():
	pass

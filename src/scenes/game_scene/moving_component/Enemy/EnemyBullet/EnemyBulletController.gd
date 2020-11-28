extends KinematicBody2D

var player
var movement
var direction
var speed = 250
var head_count = 0

func _ready():
	player = get_tree().root.get_node('Root/PlayerRocket')
	direction = (player.position - get_parent().position).normalized()

	
func _physics_process(delta):
	var collision = move_and_collide(direction*speed*delta)
	if collision != null: 
		if "PlayerRocket" in collision.collider.name:
			#send GameOver signals here
			get_parent().remove_child(self)
		elif "EnemyRocket" in collision.collider.name:
			get_tree().queue_delete(collision.collider)
		else:
			get_parent().remove_child(self)			

func _on_Timer_timeout():
	get_tree().queue_delete(self)

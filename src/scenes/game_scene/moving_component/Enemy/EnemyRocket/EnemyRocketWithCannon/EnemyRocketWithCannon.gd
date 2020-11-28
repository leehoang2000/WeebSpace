extends "res://scenes/game_scene/moving_component/Enemy/EnemyRocket/EnemyRocket.gd"


func _ready():
	speed = 20

	
func _physics_process(delta):
	var movement = direction * speed * delta
	var collision = move_and_collide(movement)
	if collision != null:
		var collider_name = collision.collider.name
		if 'EnemyRocket' in collider_name:
			get_tree().queue_delete(collision.collider)
		else:
			speed = 0

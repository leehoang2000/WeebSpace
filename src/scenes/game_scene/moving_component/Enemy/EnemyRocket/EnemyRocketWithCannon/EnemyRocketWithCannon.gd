extends "res://scenes/game_scene/moving_component/Enemy/EnemyRocket/EnemyRocket.gd"


func _ready():
	speed = 20

	
func _physics_process(delta):
	var movement = direction * speed * delta
	var collision = move_and_collide(movement)
	if collision != null:
		var collider_name = collision.collider.name
		if 'EnemyRocket' in collider_name:
			collision.collider.immediate_destruction()
		else:
			speed = 0

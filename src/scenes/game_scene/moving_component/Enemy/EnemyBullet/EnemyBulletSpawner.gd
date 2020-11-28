extends "res://scripts/Spawner.gd"

var rng = RandomNumberGenerator.new()


func _ready():
	spawn_scene = load("res://scenes/game_scene/moving_component/Enemy/EnemyBullet/EnemyBullet.tscn")
	max_spawn = null
	get_node("SpawnTimer").set_wait_time(rng.randf_range(3,5))


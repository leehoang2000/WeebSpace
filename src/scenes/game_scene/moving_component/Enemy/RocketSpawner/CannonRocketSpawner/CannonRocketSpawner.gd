extends "res://scenes/game_scene/moving_component/Enemy/RocketSpawner/RocketSpawner.gd"


func _ready():
	spawn_scene = load("res://scenes/game_scene/moving_component/Enemy/EnemyRocket/EnemyRocketWithCannon/EnemyRocketWithCannon.tscn")

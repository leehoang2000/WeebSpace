extends "res://scenes/game_scene/moving_component/Enemy/RocketSpawner/RocketSpawner.gd"


func _ready():
	lower_bound = -1000
	upper_bound = 600
	spawn_range = 500

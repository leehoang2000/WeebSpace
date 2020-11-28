extends "res://scenes/game_scene/moving_component/Enemy/RocketSpawner/RocketSpawner.gd"

var last_position
var x_range = 1000
var y_range = 1000

# Positive integer only
func random_vector_within_range(x, y):
	return Vector2(rng.randi_range(x/4, x), rng.randi_range(y/4, y))

func get_position()-> Vector2:
	var player_position = player.position
	if last_position == null or last_position == player_position:
		last_position = player_position
		return player_position + random_vector_within_range(x_range, y_range)
	else:
		var displacement_vector = player_position - last_position
		last_position = player_position
		return player_position + displacement_vector * 32 + Vector2(x_range/2, y_range/2)
	

extends "res://scenes/game_scene/moving_component/Enemy/RocketSpawner/RocketSpawner.gd"

var last_position
var x_range = 1500
var y_range = 1500

# Positive integer only
func random_vector_within_range():
	return Vector2(rng.randi_range(-x_range, x_range), rng.randi_range(-y_range, y_range))

func get_position()-> Vector2:
	var player_position = player.position
	if last_position == null or last_position == player_position:
		last_position = player_position
		return player_position + random_vector_within_range()
	else:
		var displacement_vector = player_position - last_position
		last_position = player_position
		return (player_position 
				+ displacement_vector * 16
				+ rng.randf_range(-64, 64) * Vector2(displacement_vector.y, (-1)*displacement_vector.x)
				+ random_vector_within_range())

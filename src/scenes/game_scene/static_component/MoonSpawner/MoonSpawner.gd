extends "res://scripts/Spawner.gd"


func _ready():
	spawn_scene = preload('res://scenes/game_scene/static_component/Moon/Moon.tscn')
	max_spawn = -1
	spawn_area = Rect2(player_position.position.x -2000, player_position.position.y-2000, player_position.position.x+2000, player_position.position.y+2000)

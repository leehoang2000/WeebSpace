extends "res://scripts/Spawner.gd"

var player
var rng = RandomNumberGenerator.new()
var lower_bound = -5000
var upper_bound = 800
var spawn_range = 4200
var initial_spawn_number = 60

func get_position()-> Vector2:
	var player_positiion = player.position
	var direction_chance = rng.randi_range(0,3) # direction to spawn compare to player
	var rocket_position
	match direction_chance:
		0:
			rocket_position =  Vector2(player_positiion.x +lower_bound, player_positiion.y +lower_bound)
		1:
			rocket_position =  Vector2(player_positiion.x + upper_bound, player_positiion.y +lower_bound)
		2:
			rocket_position =  Vector2(player_positiion.x + lower_bound, player_positiion.y + upper_bound)
		3:
			rocket_position =  Vector2(player_positiion.x + upper_bound, player_positiion.y +upper_bound)
		_:
			rocket_position =  Vector2(player_positiion.x - 3400 , player_positiion.y - 3236)
	
	rocket_position = rocket_position + Vector2(rng.randi_range(0, spawn_range), rng.randi_range(0, spawn_range))
	return rocket_position

func _ready():
	spawn_scene = load('res://scenes/game_scene/static_component/Moon/Moon.tscn')
	player = get_tree().root.get_node("Root/PlayerRocket")
	for i in range(initial_spawn_number):
		instance_spawn()

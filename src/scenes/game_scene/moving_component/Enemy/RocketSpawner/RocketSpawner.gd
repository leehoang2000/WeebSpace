extends "res://scripts/Spawner.gd"
var lower_bound = -3000
var upper_bound = 2000
var spawn_range = 2600
var rng = RandomNumberGenerator.new()
var player

func plug_attribute(xnode):
	var mutation_chance = rng.randf_range(0,1)
	if mutation_chance < 0.2:
		if xnode.speed:
			xnode.speed = xnode.speed * 1.5
			xnode.modulate = Color('#adce74')
			
	if mutation_chance < 0.05:
		xnode.apply_scale(Vector2(2,2))
		
	if mutation_chance < 0.01:
		if xnode.speed:
			xnode.speed = xnode.speed * 2
		xnode.apply_scale(Vector2(0.3, 0.3))
		xnode.modulate = Color('#ea2c62')
	return xnode

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
	max_spawn = null
	spawn_scene = load("res://scenes/game_scene/moving_component/Enemy/EnemyRocket/EnemyRocket.tscn")
	player = get_tree().root.get_node("Root/PlayerRocket")
	rng.randomize()

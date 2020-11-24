extends Node2D

var tilemap
var tree_tilemap

# Spawner variables
var player_position
export var spawn_area : Rect2 
export var max_spawn = 20
export var start_spawn = 2
var spawn_count = 0
var spawn_scene = preload('res://scenes/game_scene/static_component/Moon/Moon.tscn')
var spawn_max_distance = 600

# Random number generator
var rng = RandomNumberGenerator.new()


func get_spawn_area():
	spawn_area = Rect2(player_position.position.x-spawn_max_distance, player_position.position.y-spawn_max_distance, player_position.position.x+spawn_max_distance, player_position.position.y+spawn_max_distance)


func test_position(position : Vector2):
	pass
	
	
func instance_spawn():
	# Instance the skeleton scene and add it to the scene tree
	if not spawn_scene:
		return
	var spawn_instance = spawn_scene.instance()
	add_child(spawn_instance)
	
	# Place the skeleton in a valid position
	spawn_instance.position.x = spawn_area.position.x + rng.randf_range(0, spawn_area.size.x)
	spawn_instance.position.y = spawn_area.position.y + rng.randf_range(0, spawn_area.size.y)

	# Play skeleton's birth animation
	spawn_instance.arise()
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	player_position = get_parent().find_node('PlayerRocket')
	get_spawn_area()
	
	# Initialize random number generator
	rng.randomize()
	
	# Create skeletons
	for i in range(start_spawn):
		instance_spawn()
	spawn_count = start_spawn
	

func _on_Timer_timeout():
	get_spawn_area()
	if spawn_count < max_spawn or max_spawn == -1:
		instance_spawn()
		if max_spawn != -1:
			spawn_count = spawn_count + 1

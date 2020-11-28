extends Node2D

# Spawner variables
var max_spawn = null  # if equal null -> unlimited 
var spawn_count = 0
var spawn_scene = null
var spawn_count_per_batch = 1
var maximum_find_position_retry = 10



func test_position(position : Vector2):
	return position != null
	
func get_position()-> Vector2:
	return Vector2(0, 0)
	
func plug_attribute(xnode):
	return xnode
	
func instance_spawn():
	if spawn_scene == null:
		return null
		
	# Place the instance in a valid position		
	var spawn_position = null
	for i in range(maximum_find_position_retry):
		spawn_position = get_position()
		if test_position(spawn_position) == true:
			break
		else:
			spawn_position = null
	if spawn_position == null:
		return null
		
	var spawn_instance = spawn_scene.instance()
	spawn_instance.position = spawn_position
	spawn_instance = plug_attribute(spawn_instance)
	
	#spawn_instance.	
	add_child(spawn_instance)
	return spawn_instance
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _on_SpawnTimer_timeout():
	for i in range(spawn_count_per_batch):
		if max_spawn == null:
			instance_spawn()
		elif spawn_count < max_spawn:
			instance_spawn()
			spawn_count = spawn_count + 1
		else:
			break

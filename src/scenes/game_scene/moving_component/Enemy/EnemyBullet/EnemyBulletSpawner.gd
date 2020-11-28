extends Node2D

# Declare member variables here. Examples:
# var a = 2
var timer 
var spawnScene

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = find_node("Timer")
	if(timer):
		timer.connect("timeout",self,"_on_Timer_timeout")
	else:
		print("BulletSpawner can't find it timer")
	spawnScene = preload("res://scenes/game_scene/moving_component/Enemy/EnemyBullet/EnemyBullet.tscn")
	
func _on_Timer_timeout():
	var newBullet = spawnScene.instance()
	add_child(newBullet)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

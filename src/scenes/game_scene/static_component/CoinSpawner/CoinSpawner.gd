extends "res://scripts/Spawner.gd"


func _ready():
	spawn_scene = preload('res://scenes/game_scene/static_component/Coin/Coin.tscn')

#func get_spawn_area():
#	spawn_area = Rect2(player.position.x+2000, player.position.y+2000, 4000, 1200)

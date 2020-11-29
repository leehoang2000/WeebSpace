extends "res://scripts/Spawner.gd"

var player
var rng  = RandomNumberGenerator.new()

func get_position()-> Vector2:
	return player.position + Vector2(rng.randi_range(-800, 800), rng.randi_range(-800, 800))

func _ready():
	spawn_scene = load('res://scenes/game_scene/static_component/Coin/Coin.tscn')
	player = get_tree().root.get_node("Root/PlayerRocket")

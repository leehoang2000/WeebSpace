extends Node2D

var player


func _ready():
	player = self.find_node("PlayerRocket")
	print('Hello there')	

	
func _find_player() -> KinematicBody2D:
	return player



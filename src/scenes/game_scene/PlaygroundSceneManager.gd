extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = self.find_node("PlayerRocket")

	
func _find_player() -> KinematicBody2D:
	return player


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

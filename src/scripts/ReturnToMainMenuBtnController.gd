extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self,"ButtonPressed")
	
func ButtonPressed():
	SceneControlTool.ChangeScene("res://scenes//Menu.tscn",0)
	

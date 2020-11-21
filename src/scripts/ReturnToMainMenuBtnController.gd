extends Node

func _ready():
	self.connect("pressed", self,"ButtonPressed")

func ButtonPressed():
	SceneControlTool.ChangeScene("res://scenes/navigation_scene/Menu.tscn",0)


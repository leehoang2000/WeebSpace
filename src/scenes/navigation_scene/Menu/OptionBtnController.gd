extends Node

func _ready():
	self.connect("pressed", self,"ButtonPressed")

func ButtonPressed():
	SceneControlTool.ChangeScene("res://scenes/navigation_scene/Option.tscn",0)


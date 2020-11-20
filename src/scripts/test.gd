
extends Node
#Broken
func _ready():
	self.connect("prếessed", self,"ButtonPressed")
	
func ButtonPressed():
	SceneControlTool.ChangeScene("res://scenes//Menu.tscn",0)

#runnable
func _ready():
	self.connect("pressed", self,"ButtonPressed")
	
func ButtonPressed():
	SceneControlTool.ChangeScene("res://scenes//Menu.tscn",0)


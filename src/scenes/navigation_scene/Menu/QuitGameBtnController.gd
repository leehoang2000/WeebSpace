extends Node

func _ready():
	self.connect("pressed",self,"QuitGame")

func QuitGame():
	get_tree().quit()

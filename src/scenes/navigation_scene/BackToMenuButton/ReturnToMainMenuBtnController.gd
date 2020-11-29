extends Node

signal end_game(blob)
var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')


func _ready():
	self.connect("pressed", self,"ButtonPressed")
	self.connect('end_game', get_tree().root.get_node("/root/EventBus"), '_general_signal_handler')
	

func ButtonPressed():
	emit_signal('end_game', Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.GAME_MENU, null))
	SceneControlTool.ChangeScene("res://scenes/navigation_scene/Menu/Menu.tscn",0)
	

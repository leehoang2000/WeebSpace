extends Button

signal start_game(blob)
var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')

func _ready():
	self.connect("pressed",self,"_button_pressed")
	self.connect('start_game', get_tree().root.get_node("/root/EventBus"), '_general_signal_handler')

func _button_pressed():
	emit_signal('start_game', Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.GAME_RUNNING, null))
	SceneControlTool.ChangeScene("res://scenes/game_scene/Playground.tscn",0)


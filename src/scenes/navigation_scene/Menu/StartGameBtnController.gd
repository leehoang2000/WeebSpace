extends Button

func _ready():
	self.connect("pressed",self,"_button_pressed")

func _button_pressed():
	SceneControlTool.ChangeScene("res://scenes/game_scene/Playground.tscn",0)


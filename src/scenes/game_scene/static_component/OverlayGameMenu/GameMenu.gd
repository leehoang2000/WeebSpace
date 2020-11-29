extends Camera2D

var player 

func _ready():
	player = get_tree().root.get_node("Root/PlayerRocket")

func _physics_process(delta):
	position = player.position

func _handle_Game_End(status):
	$MenuOnEndGame/PopupMenu/ScoreDisplayer.text = $InGameLayer/ScoreDisplayer.text.split('/')[0]
	$MaskLayer.visible = true		
	$MenuOnEndGame.visible = true

func _handle_Score_Change(value: String):
	$InGameLayer/ScoreDisplayer.text = value


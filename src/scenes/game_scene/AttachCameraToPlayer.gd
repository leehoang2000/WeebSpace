extends Camera2D

var player 

func _ready():
	player = get_tree().root.get_node("Root/PlayerRocket")

func _physics_process(delta):
	position.x = player.position.x
	position.y = player.position.y

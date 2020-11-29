extends Node

var id = null
var type = null
var otherValue = null

enum TYPE{
	DEAD,
	COLLIDED,
	BOOSTED,
	BLINK,
	PLAYER_DEAD,
	
	ENEMY_BORN,
	ENEMY_DEAD,
	ENEMY_RECYCLE,
	
	GAME_MENU,
	GAME_RUNNING,
	GAME_END_MENU,
}

func _init(id, type, otherValue):
	self.id = id
	self.type = type
	if otherValue != null:
		self.otherValue = otherValue


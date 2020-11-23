extends Node
enum {ATTACHED,RELEASED}
var currentState

func _ready():
	currentState = RELEASED

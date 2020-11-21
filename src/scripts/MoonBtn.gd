extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var center

# Called when the node enters the scene tree for the first time.
func _ready():
	center = get_parent().global_position
	self.connect("pressed",self,"_emit_orbit_signal")
	
func _emit_orbit_signal():
	var label = get_parent().find_node("StateLabel")
	match RocketStates.currentState:
		RocketStates.ATTACHED:
			EventBus.emit_signal("attach_to_moon",[RocketStates.RELEASED,center])
			label.text = ""
		RocketStates.RELEASED:
			EventBus.emit_signal("attach_to_moon",[RocketStates.ATTACHED,center])
			label.text = "ATTACHED"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

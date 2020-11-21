extends KinematicBody2D

var speed = 3
var center

func _ready():
	EventBus.connect("attach_to_moon",self,"_change_state")
	RocketStates.currentState = RocketStates.RELEASED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match RocketStates.currentState:
		RocketStates.ATTACHED:
			_orbit(delta)
		RocketStates.RELEASED:
			_free_fly(delta)
			
func _orbit(delta):
	look_at(center)
	move_and_collide(_get_current_rocket_direction()*speed*delta)
	
func _free_fly(delta):
	move_and_collide(_get_current_rocket_direction()*speed*delta)

func _change_state(var state):
	#State of rocket is state[0]. Center of the moon it attached to is state[1]
	RocketStates.currentState = state[0]
	center = state[1]
	
func _get_current_rocket_direction() -> Vector2:
	return get_node("RocketHead").global_position - get_node("RocketRear").global_position

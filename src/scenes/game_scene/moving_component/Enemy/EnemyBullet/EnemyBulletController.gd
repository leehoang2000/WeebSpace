extends KinematicBody2D

var player
var movement
var direction
var speed = 2

func _ready():
	player = get_parent().get_parent().get_parent().get_parent().find_node('PlayerRocket')	
	if (player):
		direction = player.position - self.position
		direction.normalized()
	else: 
		print("EnemyBulletController can't find player")
		self.remove_and_skip()
	
func _physics_process(delta):
	if(direction):
		var collision = move_and_collide(direction*speed*delta)
		if(collision): 
			if("PlayerRocket" in collision.collider.name):
				get_parent().remove_child(self)
				remove_and_skip()
			#send GameOver signals here
			elif(!"EnemyRocket" in collision.collider.name ):
				get_parent().remove_child(self)
				remove_and_skip()
	else:
		print("EnemyBulletController can't determine direction")
		get_parent().remove_child(self)

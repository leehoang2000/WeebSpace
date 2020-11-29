extends KinematicBody2D


signal game_end(blob)


var player
var movement
var direction
var speed = 250
var head_count = 0
var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')


func _ready():
	player = get_tree().root.get_node('Root/PlayerRocket')
	direction = (player.position - get_parent().position).normalized()
	self.connect('game_end', get_tree().root.get_node("/root/EventBus"),'_general_signal_handler')
	
func _physics_process(delta):
	var collision = move_and_collide(direction*speed*delta)
	if collision != null: 
		if "PlayerRocket" in collision.collider.name:
			#send GameOver signals here
			emit_signal("game_end", Signal_Blob.new(self.get_instance_id(), Signal_Blob.TYPE.PLAYER_DEAD, null))
			get_parent().remove_child(self)
		elif "EnemyRocket" in collision.collider.name:
			collision.collider.immediate_destruction()
		else:
			get_parent().remove_child(self)			

func _on_Timer_timeout():
	get_tree().queue_delete(self)

extends Node

signal game_end(status)
signal score_change(value)

var Signal_Blob = load('res://scripts/Signal/Signal_Blob.gd')
var game_status

var current_score = 0
var total_enemy_count = 0


func _general_signal_handler(blob):
	#TODO: move this to ready
	self.connect('game_end', get_tree().root.get_node('Root/OverlayGameMenu'), '_handle_Game_End')
	self.connect('game_end', get_tree().root.get_node('Root/PlayerRocket'), '_handle_Game_End')
	self.connect('score_change', get_tree().root.get_node('Root/OverlayGameMenu'), '_handle_Score_Change')
	match blob.type:
		Signal_Blob.TYPE.PLAYER_DEAD:
			if game_status == Signal_Blob.TYPE.GAME_RUNNING:
				var end_signal =  Signal_Blob.new(self.get_instance_id(), game_status, null)
				emit_signal("game_end", end_signal)
				game_status = Signal_Blob.TYPE.GAME_MENU
				
		Signal_Blob.TYPE.ENEMY_BORN:
			if game_status == Signal_Blob.TYPE.GAME_RUNNING:
				total_enemy_count += 1
				emit_signal('score_change', str(current_score)+ '/' + str(total_enemy_count))
		
		Signal_Blob.TYPE.ENEMY_DEAD:
			if game_status == Signal_Blob.TYPE.GAME_RUNNING:
				current_score += 1
				emit_signal('score_change', str(current_score)+ '/' + str(total_enemy_count))
			#print('Enemy has fallen')
		
		Signal_Blob.TYPE.ENEMY_RECYCLE:
			if blob.id != null:
				get_tree().queue_delete(instance_from_id(blob.id))
						
		Signal_Blob.TYPE.DEAD:
			pass
			#print('something died')
		Signal_Blob.TYPE.GAME_MENU:
			current_score = 0
			total_enemy_count = 0
			emit_signal('score_change', str(current_score)+ '/' + str(total_enemy_count))
			game_status = Signal_Blob.TYPE.GAME_MENU
			
		Signal_Blob.TYPE.GAME_RUNNING:
			game_status = Signal_Blob.TYPE.GAME_RUNNING
		_:
			pass
		
func _ready():
	print('Signal Bus connected')
	game_status = Signal_Blob.TYPE.GAME_MENU

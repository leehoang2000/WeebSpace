extends Area2D

var player
var booster

func _ready():
	player = get_tree().root.get_node("Root/PlayerRocket")


func _on_Coin_body_entered(body):
	if body.name == "PlayerRocket":
		booster = player.speed * 0.5
		player.speed = player.speed + booster
		if player.coin_speed_boost_count == 0:
			player.modulate = Color('#fecd1a')
		player.coin_speed_boost_count += 1
		self.visible = false
		get_node("BoostExpireTimer").start()


func _on_BoostExpireTimer_timeout():
	player.speed = player.speed - booster
	player.coin_speed_boost_count -= 1
	if player.coin_speed_boost_count == 0:
		player.modulate = Color('#fbf6f0')
	get_tree().queue_delete(self)

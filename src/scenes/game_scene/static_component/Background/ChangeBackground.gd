extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	get_node("Sprite").modulate = color_rotation() 

func color_rotation():
	var list = '0123456789abcdef'
	var hex_color_value = '#'
	for i in range(0,6):
		hex_color_value += list[rng.randi_range(0, len(list)-1)]
	return Color(hex_color_value)
	
func _on_DrasticChangeSceenTimer_timeout():
	get_node("Sprite").modulate = color_rotation()
	get_node("DrasticChangeSceenTimer").wait_time = rng.randf_range(get_node("DrasticChangeSceenTimer").wait_time, min(get_node("DrasticChangeSceenTimer").wait_time*1.5, 180))

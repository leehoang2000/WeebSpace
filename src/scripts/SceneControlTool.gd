extends Node

#change to scene at "path" after "delay" amount of seconds
func ChangeScene(path, delay):
	yield(get_tree().create_timer(delay),"timeout")
	assert(get_tree().change_scene(path) == OK)

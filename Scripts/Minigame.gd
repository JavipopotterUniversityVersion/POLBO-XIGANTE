extends Node
class_name Minigame

var success:bool
signal on_finished

func completed():
	success = true

func has_won():
	return success

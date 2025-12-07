extends Node
class_name Minigame

var success:bool

func completed():
	success = true

func has_won():
	return success

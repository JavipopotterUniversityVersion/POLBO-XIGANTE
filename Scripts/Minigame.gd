extends Node
class_name Minigame

var success:bool = false
signal on_finished

func finished():
	on_finished.emit()

func succed():
	success = true

func has_won() -> bool:
	return success

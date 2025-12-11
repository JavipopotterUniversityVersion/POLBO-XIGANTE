extends Node
class_name Minigame

@export_range(0, 1, 0.1) var intensity:float = 1

var success:bool = false
signal on_finished

func finished():
	on_finished.emit()

func succed():
	success = true

func has_won() -> bool:
	return success

extends Minigame
class_name CountingMinigame

@export var count:int

func freeOne():
	count -= 1
	if count <= 0:
		succed()

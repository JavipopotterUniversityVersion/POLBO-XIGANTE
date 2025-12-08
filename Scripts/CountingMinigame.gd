extends Minigame
class_name CountingMinigame

@export var count:int

func freeOne():
	count -= 1
	print("count")
	if count <= 0:
		succed()

extends AnimatedSprite2D

@export var animationName:String

func playAnim():
	play(animationName)
	await animation_finished

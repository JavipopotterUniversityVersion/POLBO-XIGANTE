extends AnimatedSprite2D

@export var animationName:String
@export var idle:String

func playAnim():
	play(animationName)
	await animation_looped
	play(idle)

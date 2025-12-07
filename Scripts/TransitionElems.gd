extends Control
class_name TransitionElems

@export var animation:AnimationPlayer
@export var animation_names:Array[StringName]

func start():
	animation.play(&"START")

func animate():
	animation.play(animation_names.pick_random())

func fade():
	pass

func unfade():
	pass

extends Control

@export var anims:Array[AnimationPlayer]

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	var lives:Lives = get_tree().get_first_node_in_group(&"Lives")
	lives.on_lives_changed.connect(update_display)

func update_display(value:int):
	anims[value].play(&"FALL")

extends Node2D
var anims:Array[AnimationPlayer]
var init_pos:Vector2

func _ready() -> void:
	init_pos = position
	var children = get_children()
	for child in children:
		anims.push_back(child.get_node("guille/animation"))

func _process(delta: float) -> void:
	await get_tree().create_timer(0.2)
	anims.pick_random().play(&"jump")

func _physics_process(delta: float) -> void:
	position.x = init_pos.x + sin(delta)

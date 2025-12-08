extends Area2D

var is_hovering:bool = false
var clicked:bool = false

var offset:Vector2

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Click") && is_hovering:
		clicked = true
		offset = get_global_mouse_position() - global_position
	elif Input.is_action_pressed("Click") && clicked:
		global_position = get_global_mouse_position() - offset
	elif Input.is_action_just_released("Click"):
		clicked = false

func _on_mouse_entered() -> void:
	if not clicked:
		is_hovering = true

func _on_mouse_exited() -> void:
	is_hovering = false

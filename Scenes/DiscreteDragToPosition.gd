extends RigidBody2D

var is_hovering:bool = false
var clicked:bool = false

func _process(delta: float) -> void:
	
	clicked = Input.is_action_pressed("Click")
	
	if is_hovering && clicked:
		position.x = get_global_mouse_position().x


func _on_mouse_entered() -> void:
	if not clicked:
		is_hovering = true



func _on_mouse_exited() -> void:
	is_hovering = false

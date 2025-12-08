extends Area2D

var is_hovering:bool = false
var clicked:bool = false
var in_area:bool = false
var finish:bool = false

var offset:Vector2
var areaPosition:Vector2

signal finished

func _process(delta: float) -> void:
	if finish:
		return
	
	if Input.is_action_just_pressed("Click") && is_hovering:
		clicked = true
		offset = get_global_mouse_position() - global_position
	elif Input.is_action_pressed("Click") && clicked:
		global_position = get_global_mouse_position() - offset
	elif Input.is_action_just_released("Click"):
		clicked = false
		
		if in_area:
			global_position = areaPosition - offset
			finish = true
			finished.emit()

func _on_mouse_entered() -> void:
	if not clicked:
		is_hovering = true

func _on_mouse_exited() -> void:
	is_hovering = false
	

func _on_body_entered(body: StaticBody2D) -> void:
	in_area = true
	areaPosition = body.global_position

func _on_body_exited(body: StaticBody2D) -> void:
	in_area = false

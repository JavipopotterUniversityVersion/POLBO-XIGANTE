extends Node2D

@export var clear_speed = 10.0
var lastpos : Vector2 = Vector2(0,0)
var actDirt = 1.0
var isInside = false
var finished = false
var _material : Material
signal completed
func _ready():
	var childArea: Area2D = get_child(0)
	_material = get_material()
	childArea.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	childArea.connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered():
	isInside = true

func _on_mouse_exited():
	isInside = true

func finish():
	print("GANASTE")
	finished = true
	completed.emit()

func  _process(delta: float) -> void:
	if finished :
		return
	if isInside:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) :
			var actPos = get_local_mouse_position()
			var diff :float = abs(actPos.distance_to(lastpos))
			lastpos = actPos
			actDirt = actDirt - (diff*clear_speed*delta)
			_material.set_shader_parameter("dirt_strength",actDirt)
			if actDirt< 0 :
				_material.set_shader_parameter("dirt_strength",0)
				finish()
			
		
	

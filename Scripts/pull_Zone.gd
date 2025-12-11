extends Area2D

var actDirt = 1.0
var isInside = false
var finished = false
var dragging = false
var initPos: Vector2
var offset :Vector2
@export var cows: TextureRect

var initcowSize : Vector2
@export var goal: Node2D
@export var goalOffset : float = 20.0
signal completed
func _ready():
	initPos = global_position
	initcowSize = cows.size
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

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
	if Input.is_action_just_pressed("Click") && isInside:
		dragging = true
		offset = get_global_mouse_position() - global_position
	elif Input.is_action_pressed("Click") && dragging:
		global_position.x = (get_global_mouse_position() - offset).x
	elif Input.is_action_just_released("Click"):
		if global_position.x > goal.global_position.x-goalOffset && global_position.x < goal.global_position.x+goalOffset:
			finish()
		else:
			global_position = initPos
			dragging = false
	var deltaX = global_position.x- initPos.x
	var factor = 0.0056
	var new_factor= 1.0 + deltaX * factor
	cows.size = Vector2(initcowSize.x ,initcowSize.y* new_factor)

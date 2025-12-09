extends Area2D

signal clicked;

var timer:float = 0

var hovering:bool = false
@export var cooldown:float = 0.1

func _ready() -> void:
	timer = cooldown

func _on_mouse_entered() -> void:
	hovering = true

func _on_mouse_exited() -> void:
	hovering = false

func _process(delta: float) -> void:
	timer += delta
	
	if hovering && Input.is_action_just_pressed("Click") && timer > cooldown:
		clicked.emit()
		timer = 0

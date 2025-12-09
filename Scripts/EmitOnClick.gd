extends CollisionShape2D

signal clicked;

var hovering:bool = false
@export var cooldown:float = 0.1

func _on_mouse_entered() -> void:
	hovering = true

func _on_mouse_exited() -> void:
	hovering = false

func _process(delta: float) -> void:
	if hovering && Input.is_action_just_pressed("Click"):
		clicked.emit()
		await get_tree().create_timer(cooldown).timeout;

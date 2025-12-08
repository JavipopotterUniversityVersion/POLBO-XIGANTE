extends Node2D


func _ready():
	var childArea: Area2D = get_child(0)
	
	childArea.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	childArea.connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered():
	print("El ratón está encima del MeshInstance2D!")
"shader_parameter/dirt_strength"
	

func _on_mouse_exited():
	print("El ratón ya no está encima.")
	

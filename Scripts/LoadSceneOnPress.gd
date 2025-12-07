extends Button

@export var scene:String

func _on_pressed() -> void:
	SceneManager.change_scene(scene)

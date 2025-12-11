extends Node
@export var song_name:StringName

func _ready() -> void:
	AudioManager.play_ovani(song_name)

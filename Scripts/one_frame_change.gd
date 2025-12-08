extends TextureRect

@export var normal_tex:Texture2D
@export var altered_textures:Array[Texture2D]

@export var probability:float = 0.05
@export var altered_duration:float = 0.1


func _process(delta: float) -> void:
	if randf_range(0, 1) < probability:
		texture = altered_textures.pick_random()
		await get_tree().create_timer(altered_duration).timeout
		texture = normal_tex

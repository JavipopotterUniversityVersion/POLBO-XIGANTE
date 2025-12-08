extends Resource
class_name TransitionSetting

@export var trans_mask:Texture2D

@export var start_pos: Vector2
@export var end_pos: Vector2
@export var pos_curve: Curve

func get_pos(t: float) -> Vector2:
	return lerp(start_pos, end_pos, pos_curve.sample(t))


@export var start_grid_size: Vector2 = Vector2(1, 1)
@export var end_grid_size: Vector2 = Vector2(1, 1)
@export var grid_curve: Curve

func get_grid_size(t: float) -> Vector2:
	return lerp(start_grid_size, end_grid_size, grid_curve.sample(t))


@export var start_angle: float = 0.0
@export var end_angle: float = 0.0
@export var rotation_curve: Curve

func get_angle(t: float) -> float:
	return lerp(start_angle, end_angle, rotation_curve.sample(t))

@export var final_progress := 4

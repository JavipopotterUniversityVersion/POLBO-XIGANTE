extends Sprite2D

const MIN_ROT := -60
const MAX_ROT := 60

const MARGIN := 50.0

var current_dist:float
@export var target_dist:float
@export var dist_loose:float
@export var guy:Node2D
@export var minigame:Minigame
@export var progress_bar:ProgressBar

var guy_last_pos:Vector2

func _ready() -> void:
	progress_bar.max_value = target_dist

func _process(delta: float) -> void:
	if target_dist < current_dist: return
	
	current_dist -= dist_loose * delta
	current_dist += guy_last_pos.distance_to(guy.global_position)
	guy_last_pos = guy.global_position
	
	var mouse_pos = get_local_mouse_position()
	var rot = mouse_pos.x / MARGIN
	rotation = clamp(rot, MIN_ROT, MAX_ROT)
	
	progress_bar.value = current_dist
	
	if target_dist < current_dist:
		minigame.succed()

extends Button
@export var fire:GPUParticles2D
@export var smoke:GPUParticles2D
var init_lives:int
var lives:int

func _ready() -> void:
	init_lives = randf_range(1,3)
	lives = init_lives
	button_down.connect(touch)

func touch():
	lives -= 1
	fire.amount_ratio = float(lives) / float(init_lives)
	if lives == 0:
		smoke.amount_ratio = 1

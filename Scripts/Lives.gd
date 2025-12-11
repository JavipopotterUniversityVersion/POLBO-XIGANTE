extends Node
class_name Lives

@export var init_lives:int = 3
var current_lives:int = init_lives

signal no_lives_left
signal on_lives_changed

func add_lives(lives:int):
	current_lives += lives
	update_lives()

func add_live():
	current_lives += 1
	update_lives()

func substract_live():
	current_lives -= 1
	current_lives = clamp(0,current_lives,5)
	update_lives()

func substract_lives(lives:int):
	current_lives -= lives
	update_lives()

func reset_lives():
	current_lives = init_lives
	update_lives()

# Updates everything that needs to be updated when lives change
func update_lives():
	on_lives_changed.emit(current_lives)
	if(current_lives <= 0):
		no_lives_left.emit()
		# SceneManager.change_scene([lose_scene_path]) 

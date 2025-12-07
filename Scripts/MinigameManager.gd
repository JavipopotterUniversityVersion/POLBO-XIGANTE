extends Node
class_name MinigameManager

@export var transition_elems:TransitionElems
@export var lives:Lives

@export var all_minigames:Array[PackedScene]
var available_games:Array[PackedScene]

var speed:float = 1
const MAX_SPEED := 1.75
const transition_time := 2

func start():
	available_games = all_minigames
	transition_elems.start()
	
	await get_tree().create_timer(transition_time).timeout
	
	while speed < MAX_SPEED:
		while available_games.size() > 0:
			var minigame:Minigame = spawn_random_game()
			
			transition_elems.fade()
			await minigame.on_finished
			transition_elems.unfade()
			
			if not minigame.has_won():
				lives.substract_live()
			
			await get_tree().create_timer(transition_time).timeout
		accelerate()
	win()

func win():
	#TODO
	pass

func spawn_random_game() -> Minigame:
	var minigame:PackedScene = available_games.pick_random()
	available_games.erase(minigame)
	var minigame_instance:Minigame = minigame.instantiate()
	add_child(minigame_instance)
	return minigame_instance

func accelerate():
	speed += 0.25
	Engine.time_scale = speed
	available_games = all_minigames

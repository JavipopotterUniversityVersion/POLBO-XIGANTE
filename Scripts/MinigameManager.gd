extends Node
class_name MinigameManager

@export var transition_elems:TransitionElems
@onready var lives:Lives

@export var all_minigames:Array[PackedScene]
var available_games:Array[PackedScene]

var speed:float = 1
const MAX_SPEED := 2
const transition_time := 2

var intensity := 0

func _ready() -> void:
	lives = get_tree().get_first_node_in_group(&"Lives")
	start()

func start():
	available_games = all_minigames.duplicate()
	await get_tree().create_timer(transition_time).timeout
	
	while speed < MAX_SPEED:
		while available_games.size() > 0:
			var minigame:Minigame = spawn_random_game()
			
			await transition_elems.fade()
			
			AudioManager.set_ovani_intesity("boogie", minigame.intensity)
			await minigame.on_finished
			AudioManager.set_ovani_intesity("boogie", 0.5)
			
			if available_games.size() == 0:
				if speed >= MAX_SPEED:
					available_games = []
				else: accelerate()
			else: transition_elems.unfade()
			
			if not minigame.has_won():
				AudioManager.play_sound("no")
				lives.substract_live()
			else:
				AudioManager.play_sound("si")
				
			
			await get_tree().create_timer(0.2).timeout
			minigame.queue_free()
			await get_tree().create_timer(transition_time).timeout
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
	speed += 0.5
	Engine.time_scale = speed
	available_games = all_minigames.duplicate()
	transition_elems.accelerate()
	AudioManager.set_ovani_speed("boogie", 1 + 0.25 * ((speed-1) / (MAX_SPEED-1)))

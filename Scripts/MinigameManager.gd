extends Node
class_name MinigameManager

@export var all_minigames:Array[PackedScene]
var available_games:Array[PackedScene]

@export var animation_player:AnimationPlayer
@export var transition_animations:Array[StringName]

var speed:float = 1
const MAX_SPEED := 1.75

func start():
	available_games = all_minigames
	while speed < MAX_SPEED:
		while available_games.size() > 0:
			var minigame:Minigame = spawn_random_game()
			await minigame.on_finished
			animation_player.play(transition_animations.pick_random())
			await animation_player.animation_finished
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

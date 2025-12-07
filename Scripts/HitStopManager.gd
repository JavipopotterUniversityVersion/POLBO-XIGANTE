extends Node

func hit_stop_short():
	Engine.time_scale = 0
	await get_tree().create_timer(0.15, true, false, true).timeout
	Engine.time_scale = 1
	

func hit_stop_long():
	Engine.time_scale = 0
	await get_tree().create_timer(0.3, true, false, true).timeout
	Engine.time_scale = 1

func slow_mo_short():
	Engine.time_scale = 0.3
	await get_tree().create_timer(1, true, false, true).timeout
	Engine.time_scale = 1

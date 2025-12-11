extends Node

func play_sound(s_name:String):
	var audio_player:AudioStreamPlayer = get_node(s_name)
	audio_player.play()

func stop_sound(s_name:String):
	var audio_player:AudioStreamPlayer = get_node(s_name)
	audio_player.stop()

func play_ovani(s_name:String):
	var ovani_player:OvaniPlayer = get_node(s_name)
	ovani_player.PlaySongNow(ovani_player.QueuedSongs[0])

func set_ovani_intesity(s_name:String, intensity:float):
	var ovani_player:OvaniPlayer = get_node(s_name)
	ovani_player.Intensity = intensity

func set_ovani_speed(s_name:String, speed:float):
	var ovani_player:OvaniPlayer = get_node(s_name)
	ovani_player.set_song_speed(speed)

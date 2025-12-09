extends Node

func play_sound(s_name:String):
	var audio_player:AudioStreamPlayer = get_node(s_name)
	audio_player.play()

func stop_sound(s_name:String):
	var audio_player:AudioStreamPlayer = get_node(s_name)
	audio_player.stop()

extends Minigame
@export var candle_nodes:Array[Node2D]
var candles:Array[Candle]
signal on_sucess

func _ready() -> void:
	for candle in candle_nodes:
		candle.visible = false
	
	var active_candles:int = randf_range(candle_nodes.size()/2, candle_nodes.size())
	var shuffled := candle_nodes.duplicate()
	
	shuffled.shuffle()
	var selected := shuffled.slice(0, active_candles)
	
	for sel in selected:
		sel.visible = true
		var candle:Candle = sel.get_node("trigger")
		candle.on_candle_papeado.connect(func(): on_turned_off(candle), CONNECT_ONE_SHOT)
		candles.push_back(candle)

func on_turned_off(candle):
	AudioManager.play_sound("whistle")
	candles.erase(candle)
	if candles.size() <= 0:
		print("Candle Minigame Completed!")
		succed()
		on_sucess.emit()

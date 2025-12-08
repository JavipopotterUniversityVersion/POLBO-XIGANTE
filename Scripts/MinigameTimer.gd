extends ProgressBar

# value from 0 to 1. At time*show_bar_at_percentage the bar will show
@export var show_bar_at_percentage:float = 0.4

@export var time:float = 5.0
var time_left:float = time

# signal emitted when the timer reaches 0
signal timeout

func _init() -> void:
	visible = false

func _process(delta: float) -> void:
	time_left -= delta
	value = time_left/time
	
	if time_left < time*show_bar_at_percentage:
		visible = true
	
	if time_left <= 0:
		timeout.emit()
		#print("signal emitted")

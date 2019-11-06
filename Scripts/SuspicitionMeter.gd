extends TextureProgress

var suspicion=0
export var suspcion_step=1
export var suspicion_dropoff=0.25 #how fast suspicion fals

func _ready():
	value=suspicion
	
func _process(_delta):
	suspicion-=suspicion_dropoff
	suspicion=clamp(suspicion,0,max_value)
	value=suspicion
	
func player_seen():
	suspicion +=suspcion_step
	if suspicion==100:
		end_game()

func end_game():
	get_tree().quit();

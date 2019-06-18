extends CanvasModulate

const DARK =Color("0f1d53")
const NIGHTVISION =Color("2bc92b")

func _ready():
	add_to_group("interface")
	color=DARK

func NightVision_mode():
	inform_npc("NightVision_mode")
	color = NIGHTVISION
	play_sfx(Global.nigtvision_on_sfx)
	
func DarkVision_mode():
	inform_npc("DarkVision_mode")
	color = DARK
	play_sfx(Global.nigtvision_off_sfx)
	
func play_sfx(src_file):
	$AudioStreamPlayer2D.stream=load(src_file)
	$AudioStreamPlayer2D.play()
	
func inform_npc(vision_mode):
	get_tree().call_group("npc",vision_mode)
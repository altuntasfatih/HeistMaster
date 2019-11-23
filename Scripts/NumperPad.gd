extends Popup

onready var display =$VBoxContainer/CenterContainer/DisplayContainer/Display
onready var light =$VBoxContainer/ButtonContainer/ButtonGrid/Light
var combination = []
var guess =[]

signal combination_correct;

func _ready():
	connect_buttons();
	reset_lock()
	display.bbcode_enabled=true
	$AudioStreamPlayer.autoplay=false
	set_exclusive(false)
	
func connect_buttons():
	for child in  $VBoxContainer/ButtonContainer/ButtonGrid.get_children():
		if child is Button:
			child.connect("pressed",self,"_on_Button_pressed",[child.text])
			
func _on_Button_pressed(button):
	if button == "OK":
		check_guess()
	else:
		enter(int(button))
	
func  check_guess():
	if guess == combination :
		$AudioStreamPlayer.stream = load("res://SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		$Timer.start()
		light.texture=load(Global.green_light)
	else:
		reset_lock();
	
func enter(number):
	$AudioStreamPlayer.stream=load("res://SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(number)
	update_display()

func reset_lock():
	light.texture=load(Global.red_light)
	display.clear()
	guess.clear()
	$AudioStreamPlayer.stop()
	
func update_display():
	display.bbcode_text= "[center]" + PoolStringArray(guess).join("")+ "[/center]"
	if guess.size()== combination.size(): 
		check_guess()

func _on_Timer_timeout():
	$AudioStreamPlayer.stop()
	emit_signal("combination_correct")
	hide()
	reset_lock()

extends "res://Scripts/Character.gd"

export var disguises = 3 #How many disguises you start with
export var disguise_duration = 5 #How long a disguise cat last in seconds
export var disguise_slowdown = 0.25

enum VisionMode {DARK , NIGHTVISION}
var current_mode 
var disguised = false
var vision_change_on_colldown= false 
var velocity_multpilier = 1

onready var joystick_move = $"../GUI/Joystick"

func _ready():
	Global.Player =  self
	current_mode = VisionMode.DARK
	$Timer.wait_time=disguise_duration
	reveal()
	update_disguise_display()

func _process(delta):
	move_and_slide(joystick_move.output * MAX_SPEED * velocity_multpilier)
	look_at(joystick_move.output + position )
	if disguised:
		$Label.rect_rotation= -rotation_degrees
		$Label.text  = str($Timer.time_left).pad_decimals(2)

func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode") && not vision_change_on_colldown:
		cycle_vision_mode()
		$"VisionModeTimer".start()
		vision_change_on_colldown =true
	elif  Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()
		
		
func cycle_vision_mode():
	if current_mode == VisionMode.DARK:
		get_tree().call_group("interface","NightVision_mode")
		current_mode=VisionMode.NIGHTVISION
	else:
		get_tree().call_group("interface","DarkVision_mode")
		current_mode = VisionMode.DARK
			
func _on_Timer_timeout(): 
	vision_change_on_colldown =false
	
func toggle_disguise():
	if disguised:
		reveal()
	elif disguises>0:
		disguise();
		
			
func disguise():
	$Sprite.texture=load(Global.box_sprite)
	$Light2D.texture=load(Global.box_sprite)
	$LightOccluder2D.occluder=load(Global.box_ocluder)
	collision_layer=16
	
	velocity_multpilier=disguise_slowdown
	$Timer.start()
	$Label.show()
	
	disguises-=1
	disguised=true
	update_disguise_display()
	
func reveal():
	$Label.hide()
	$Sprite.texture=load(Global.player_sprite)
	$Light2D.texture=load(Global.player_sprite)
	$LightOccluder2D.occluder=load(Global.player_ocluder)
	collision_layer=1
	disguised=false
	velocity_multpilier=1
	
func update_disguise_display():
	get_tree().call_group("DisguiseDisplay","update_disguises",disguises)

func collect_briefcase():
	var loot = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	get_tree().call_group("interface","collect_loot")

extends "res://Scripts/Character.gd"

var motion = Vector2()
enum VisionMode {DARK , NIGHTVISION}
var current_mode 
var vision_change_on_colldown= false 

func _ready():
	Global.Player = self
	current_mode = VisionMode.DARK
	
	
func _process(delta):
	update_motion(delta)
	move_and_slide(motion)


func update_motion(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_up") and not  Input.is_action_pressed("ui_down") :
		motion.y = clamp((motion.y - SPEED),-MAX_SPEED,0)
	elif Input.is_action_pressed("ui_down") and not  Input.is_action_pressed("ui_up") :
		motion.y = clamp((motion.y + SPEED),0,MAX_SPEED)
	else:
		motion.y = lerp(motion.y,0,FRICTION)
		
		
	if Input.is_action_pressed("ui_left") and not  Input.is_action_pressed("ui_right") :
		motion.x = clamp((motion.x - SPEED),-MAX_SPEED,0)
	elif Input.is_action_pressed("ui_right") and not  Input.is_action_pressed("ui_left") :
		motion.x = clamp((motion.x + SPEED),0,MAX_SPEED)
	else:
		motion.x = lerp(motion.x,0,FRICTION)
		
func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode") && not vision_change_on_colldown:
		cycle_vision_mode()
		$"VisionModeTimer".start()
		vision_change_on_colldown =true
		
func cycle_vision_mode():

	if current_mode == VisionMode.DARK:
		get_tree().call_group("interface","NightVision_mode")
		current_mode=VisionMode.NIGHTVISION
	else:
		get_tree().call_group("interface","DarkVision_mode")
		current_mode = VisionMode.DARK
			
func _on_Timer_timeout(): 
	vision_change_on_colldown =false

	

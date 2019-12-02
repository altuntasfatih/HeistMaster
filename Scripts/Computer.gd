extends Area2D
var can_click = false
var combination
export var combination_length = 4
export var lock_group = "Unset"
signal combination
onready var pop_up= $CanvasLayer/CenterContainer/ComputerPopup

func _ready():
	$Light2D.enabled=false
	generate_combination()
	initLable()
	
func initLable():
	$Label.rect_rotation=-rotation_degrees
	$Label.text=lock_group;
	
func generate_combination():
	var combination_generator= get_tree().get_root().find_node("CombinationGenerator",true,false)
	combination=combination_generator.generate_combination(combination_length)
	set_popup_text()
	emit_signal("combination",combination,lock_group)
	
func _on_Computer_body_entered(body):
	can_click=true

func _on_Computer_body_exited(body):
	can_click=false
	$Light2D.enabled=false
	pop_up.hide()
	
func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click :
		pop_up.popup_centered()
		$Light2D.enabled=true
		generate_combination()
		can_click=false
		
func set_popup_text():
	pop_up.set_text( PoolStringArray(combination).join(""))


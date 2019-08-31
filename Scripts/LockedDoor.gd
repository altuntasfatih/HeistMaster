extends "res://Scripts/Door.gd"

var combination

func _ready():
	$Label.visible=false

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumperPad.popup_centered()

func _on_Door_body_exited(body):
	can_click= false
	$CanvasLayer/NumperPad.hide()
	$CanvasLayer/NumperPad.reset_lock()
	
func _on_NumperPad_combination_correct():
	open()

func _on_Computer_combination(numbers,lock_group):
	combination=numbers
	$CanvasLayer/NumperPad.combination=combination
	$Label.rect_rotation=-rotation_degrees
	$Label.text=lock_group
	

func _on_ExitDoorSection_body_entered(body):
	open()
	
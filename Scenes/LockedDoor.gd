extends "res://Scripts/Door.gd"

var combination=[4,1,5]

func _ready():
	$CanvasLayer/NumperPad.combination=combination
	
func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumperPad.popup_centered()

func _on_Door_body_exited(body):
	can_click= false
	$CanvasLayer/NumperPad.hide()
	
	
func _on_NumperPad_combination_correct():
	open()
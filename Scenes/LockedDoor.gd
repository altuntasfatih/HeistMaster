extends "res://Scripts/Door.gd"


func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumperPad.popup_centered()


func _on_Door_body_exited(body):
	can_click= false
	$CanvasLayer/NumperPad.hide()

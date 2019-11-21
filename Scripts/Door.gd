extends Area2D

var can_click = false

func _on_Door_body_entered(body):
	if not body == Global.Player:
		open()
	else:
		can_click= true

func _on_Door_body_exited(body):
	can_click= false
	
func open():
	if not $AnimationPlayer.is_playing():
	   $AnimationPlayer.play("Open")
	
func _input(event):

	if can_click and (Input.is_mouse_button_pressed(BUTTON_LEFT) or Input.is_action_just_pressed("toggle_dooor")):
		open()
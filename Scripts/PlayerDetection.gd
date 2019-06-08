extends "res://Scripts/Character.gd"

const FOV_TOLLERANCE = 22
const MAX_DETECTION_RANGE = 320 
const RED= Color(1, .25, .25)
const WHITE= Color(1,1,1)
onready var Player = get_node("/root/Level1/Player") #Make this level neutral


func _process(delta):
	if Player_is_in_FOV_TOLLERANCE() and Player_is_in_LOS():
		$Torch.color=RED
		pass
	else:
		$Torch.color=WHITE
		pass
	

func Player_is_in_FOV_TOLLERANCE():
	var NPC_facing_direction =Vector2(1,0).rotated(global_rotation)
	var direction_to_Player = (Player.global_position - global_position).normalized()
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLLERANCE):
		return true
	else:
		return false
		
func  Player_is_in_LOS():
	var space = get_world_2d().direct_space_state
	var LOS_obstacle = space.intersect_ray(global_position,Player.global_position,[self])
	
	var distance_to_player= Player.global_position.distance_to(global_position)
	var Player_in_range=  distance_to_player < MAX_DETECTION_RANGE
	
	if  LOS_obstacle.collider == Player and Player_in_range :
		return true
	else:
		return false
	

	
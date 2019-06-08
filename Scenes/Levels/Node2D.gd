extends Node2D


onready var Player = get_node("/root/Level1/Player") #Make this level neutral
func _process(delta):
	print(position , "-",Player.position)


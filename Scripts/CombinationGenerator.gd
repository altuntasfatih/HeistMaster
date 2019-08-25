extends Node

func generate_combination(length):
	var combination = []
	for i in range(length):
		randomize()
		combination.append(randi() % 10)
	return combination
	


extends Area2D

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("Lompat"):
		if get_overlapping_bodies().size() >1:
			next_scene()

func next_scene():
	var check = get_tree().change_scene("res://test.tscn")
	
	if check!= OK :
		print("0") 

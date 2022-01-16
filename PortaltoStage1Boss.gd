extends Node2D


func _ready():
	$Panel.hide()

func _physics_process(_delta):
	if $player_in.is_colliding():
		$Panel.show()
		if(Input.is_action_just_pressed("Serang")):
			get_tree().change_scene("res://Stage1Boss.tscn")
	else:
		$Panel.hide()

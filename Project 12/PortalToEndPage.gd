extends Node2D


func _ready():
	$Panel.hide()
	hide()

func _physics_process(_delta):
	if $player_in.is_colliding():
		$Panel.show()
		if(Input.is_action_just_pressed("ENTER")):
			get_tree().change_scene("res://EndPage.tscn")
	else:
		$Panel.hide()

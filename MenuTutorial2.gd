extends Popup

var already_paused
var selected_menu
var check1 = false
var check2 = false
var check3 = false
onready var timer = $Timer
onready var timer2 = $Timer
var game_over = false
func _ready():
	check1 = false
	check2 = false
	check3 = false
	pass
	
func change_menu_color():
	$Restart.color = Color.gray
	$Restart/Label.add_color_override("font_color", Color(255,255,255))
	match selected_menu:
		1:
			$Restart.color = Color.greenyellow
			$Restart/Label.add_color_override("font_color", Color(70,70,70))

func _process(delta):
	if Input.is_action_just_pressed("Restart") :
		get_tree().change_scene("res://Game.tscn")
		hide()

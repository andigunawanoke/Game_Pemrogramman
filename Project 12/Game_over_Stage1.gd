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
	if visible:
		already_paused = get_tree().paused
		selected_menu = 1
		change_menu_color()
		if check1 == false:
			timer.start()
			$Restart.hide()
			$blinking_start.hide()
			game_over = true
			check1 = true

	if(game_over == true):
		if timer.is_stopped():
			if check2 == false:
				timer2.start()
				check2 = true
		if timer2.is_stopped():
			if check3 == false:
				$Restart.show()
				$blinking_start.show()
				check3 = true
	if Input.is_action_just_pressed("ENTER") :
		match selected_menu:
			1:
				# Restart game
				get_tree().change_scene("res://Stage1.tscn")
				hide()

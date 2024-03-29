extends Popup

var already_paused
var selected_menu


func _ready():
	pass 


func change_menu_color():
	$Resume.color = Color.gray
	$Restart.color = Color.gray
	$Quit.color = Color.gray
	$Resume/Label.add_color_override("font_color", Color(255,255,255))
	$Restart/Label.add_color_override("font_color", Color(255,255,255))
	$Quit/Label.add_color_override("font_color", Color(255,255,255))
	match selected_menu:
		0:
			$Resume.color = Color.greenyellow
			$Resume/Label.add_color_override("font_color", Color(70,70,70))
		1:
			$Restart.color = Color.greenyellow
			$Restart/Label.add_color_override("font_color", Color(70,70,70))
		2:
			$Quit.color = Color.greenyellow
			$Quit/Label.add_color_override("font_color", Color(70,70,70))

func _input(event):
	if not visible and get_parent().get_node("Game_over").game_over == false:
		if Input.is_action_just_pressed("toggle_pause"):
			# Pause game
			already_paused = get_tree().paused
			get_tree().paused = true
			# Reset the popup
			selected_menu = 0
			change_menu_color()
			# Show popup
			popup()
	else:
		if Input.is_action_just_pressed("ui_down"):
			selected_menu = (selected_menu + 1) % 3;
			change_menu_color()
		elif Input.is_action_just_pressed("ui_up"):
			if selected_menu > 0:
				selected_menu = selected_menu - 1
			else:
				selected_menu = 2
			change_menu_color()
		elif Input.is_action_just_pressed("ENTER"):
			match selected_menu:
				0:
					# Resume game
					if not already_paused:
						get_tree().paused = false
					hide()
				1:
					# Restart game
					get_tree().change_scene("res://Game.tscn")
					get_tree().paused = false
				2:
					# Quit game
					get_tree().change_scene("res://MainMenu.tscn")
					get_tree().paused = false

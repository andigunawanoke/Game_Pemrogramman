extends Node

# don't forget to use stretch mode 'viewport' and aspect 'ignore'
onready var viewport = get_viewport()

func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()

func _ready():
	var kump_musuh
	kump_musuh = $KumpMusuh.get_children()
	
	for musuh in kump_musuh:
		musuh.connect("player_hit",self,"_on_player_hit")
	pass

func _on_player_hit(damage):
	$MC._get_hit(damage)
	$GUI.updateHealth($MC._get_lives())

func _unhandled_input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()

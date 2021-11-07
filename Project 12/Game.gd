extends Node

# don't forget to use stretch mode 'viewport' and aspect 'ignore'
onready var viewport = get_viewport()
onready var _pause_menu = $PauseMenu

func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()

func _ready():
	var kump_musuh
	
	kump_musuh = $KumpMusuh.get_children()
	
	for musuh in kump_musuh:
		musuh.connect("player_hit",self,"_on_player_hit")
	
	$MC.connect("monsterhit",self,"_on_monster_hit")
	$MC.connect("monsterhit2",self,"_on_monster_hit2")

	
	

func _on_monster_hit(damage):
	$"KumpMusuh/monster_!"._get_hit(damage)

func _on_monster_hit2(damage):
	$"KumpMusuh/Slime"._get_hit(damage)
	
func _on_player_hit(damage):
	$MC._get_hit(damage)
	$GUI.updateHealth($MC._get_lives())





extends Popup

var already_paused
var selected_menu 
onready var blinkSceneChanger = $Change_Scene
var change = false

func _ready():
	show()
	selected_menu = 1
	change_menu_color()
	pass 


func change_menu_color():
	$Start_Game.color = Color.gray
	$Start_Game/Label.add_color_override("font_color", Color(255,255,255))
	match selected_menu:
		1:
			$Start_Game.color = Color.greenyellow
			$Start_Game/Label.add_color_override("font_color", Color(70,70,70))


func _input(event):
	if Input.is_action_just_pressed("ENTER"):
		match selected_menu:
			1:
				blinkSceneChanger.start()
				change = true
			
				
func _physics_process(delta):
	if(change == true and blinkSceneChanger.is_stopped()):
			hide()
			get_tree().change_scene("res://Game.tscn")

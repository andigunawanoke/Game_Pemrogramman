extends Control

onready var center_cont = $ColorRect/CenterContainer
onready var resume_button = center_cont.get_node(@"VBoxContainer/ResumeButton")
onready var root = get_tree().get_root()
onready var scene_root = root.get_child(root.get_child_count() - 1)

func _ready():
	hide()

func open():
	show()
	resume_button.grab_focus()
	

func close():
	get_tree().paused = false
	
func _on_ResumeButton_pressed():
	close()

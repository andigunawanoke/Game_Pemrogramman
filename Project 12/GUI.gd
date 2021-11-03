extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func updateHealth(health):
	if(health>=100):
		$Control3/Health_1.set_frame(2)
		$Control3/Health_2.set_frame(2)
		$Control3/Health_3.set_frame(2)
	elif(health>83.334):
		$Control3/Health_1.set_frame(1)
		$Control3/Health_2.set_frame(2)
		$Control3/Health_3.set_frame(2)
	elif(health>66.668):
		$Control3/Health_1.set_frame(0)
		$Control3/Health_2.set_frame(2)
		$Control3/Health_3.set_frame(2)
	elif(health>50.002):
		$Control3/Health_2.set_frame(1)
		$Control3/Health_3.set_frame(2)
	elif(health>33.336):
		$Control3/Health_2.set_frame(0)
		$Control3/Health_3.set_frame(2)
	elif(health>16.67):
		$Control3/Health_3.set_frame(1)
	else:
		$Control3/Health_3.set_frame(0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

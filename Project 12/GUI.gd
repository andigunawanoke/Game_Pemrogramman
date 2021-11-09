extends CanvasLayer

onready var health_label = $Control3/Label
	
func updateHealth(health):
	health_label.set_text(str(health)+"/200")
	if(health>=200):
		$Control3/Health_1.set_frame(2)
		$Control3/Health_2.set_frame(2)
		$Control3/Health_3.set_frame(2)
		$Control3/Health_4.set_frame(2)
		$Control3/Health_5.set_frame(2)
	elif(health>=180):
		$Control3/Health_1.set_frame(1)
	elif(health>=160):
		$Control3/Health_1.set_frame(0)
	elif(health>=140):
		$Control3/Health_2.set_frame(1)
	elif(health>=120):
		$Control3/Health_2.set_frame(0)
	elif(health>=100):
		$Control3/Health_3.set_frame(1)
	elif(health>=80):
		$Control3/Health_3.set_frame(0)
	elif(health>=60):
		$Control3/Health_4.set_frame(1)	
	elif(health>=40):
		$Control3/Health_4.set_frame(0)
	elif(health>=20):
		$Control3/Health_5.set_frame(1)
	else:
		$Control3.hide()
		$Game_over.show()
	






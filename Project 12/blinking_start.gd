extends Label

onready var blink = $Blinking
onready var transition = $Change_Scene
var change_Scene = false
var blinking = false

func _ready():
	show()
	blink.start()

func _physics_process(delta):
	if(Input.is_action_pressed("ENTER")):
		change_Scene = true
		blinking = false
		blink = $Blinking2
		transition.start()
	
	if(change_Scene == false):
		if(blink.is_stopped()):
			blink.start()
			if(blinking == false):
				blinking = true
			else:
				blinking = false
	else:
		if(transition.is_stopped()):
			blinking = false
		else:
			if(blink.is_stopped()):
				blink.start()
				if(blinking == false):
					blinking = true
				else:
					blinking = false
			
		
	if(blinking == true):
		hide()
	else:
		show()


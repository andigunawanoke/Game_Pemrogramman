extends CanvasLayer

onready var health_label = $Control3/Label
onready var title = $Control3/Panel
onready var title_timer = $Control3/Timer

func _ready():
	title_timer.start()
	$Control3/MC_Health/TextureProgress.value = 200
	
func _physics_process(delta):
	if(title_timer.is_stopped()):
		title.hide()
	else:
		title.show()
		
func updateHealth(health):
	health_label.set_text(str(health)+"/200")
	$Control3/MC_Health/TextureProgress.value = health
	if(health<=0):
		health = 0
		$Control3/MC_Health/TextureProgress.value = health
		$Control3.hide()
		$Game_over.show()
	
	




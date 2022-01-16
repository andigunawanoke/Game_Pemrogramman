extends CanvasLayer

onready var health_label = $Control3/Label
	

func _ready():
	$Control3/MC_Health/TextureProgress.value = 200
func updateHealth(health):
	health_label.set_text(str(health)+"/200")
	$Control3/MC_Health/TextureProgress.value = health
	if(health<=0):
		health = 0
		$Control3/MC_Health/TextureProgress.value = health
		$Control3.hide()
		$Game_over.show()
	
	






extends Node2D

export var tujuan = Vector2(0,0)
export var awal = Vector2(0,0)
export var kecepatan = 55.0
var button_pressed = false

func _ready():
	pass
	
func _physics_process(delta):
	if(button_pressed == true):
		var arah = tujuan - $Body.position
		if (arah.length() < kecepatan):
			pass
		else:
			arah = arah.normalized()
			$Body.move_and_slide(arah*kecepatan)

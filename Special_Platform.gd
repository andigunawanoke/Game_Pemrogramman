extends Node2D

export var tujuan = Vector2(0,0)
export var awal = Vector2(0,0)
export var kecepatan = 55.0

func _ready():
	pass
	
func _physics_process(delta):
	if($Body/Player_in.is_colliding()):
		var arah = tujuan - $Body.position
		if (arah.length() < kecepatan):
			print("sampai")
		else:
			arah = arah.normalized()
			$Body.move_and_slide(arah*kecepatan)

extends Node2D

var passed = false

func _ready():
	pass

func _physics_process(_delta):
	if $Player_in.is_colliding():
		passed = true
		$Player_in.enabled = false
		var tilemap = get_parent().get_parent().get_node("TileMap")
		tilemap.set_cell(16,37,2)
		tilemap.set_cell(16,38,2)
		tilemap.set_cell(16,39,2)
		tilemap.set_cell(16,40,2)
		tilemap.set_cell(-1,41,2)
		tilemap.set_cell(0,41,2)
		tilemap.set_cell(1,41,2)
		tilemap.set_cell(2,41,2)
		tilemap.set_cell(3,41,2)
		get_parent().get_parent().get_node("GUIStage1Boss/Control3/Boss_HealthBar").show()
		get_parent().get_parent().get_node("GUIStage1Boss/Control3/Boss_Name").show()
		get_parent().get_parent().get_node("GUIStage1Boss/Control3/Slime").show()
		get_parent().get_parent().get_node("KumpMusuh/SpeedySlime")._set_speed(150)
	
	

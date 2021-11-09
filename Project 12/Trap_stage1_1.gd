extends Node2D

var pressed = false
var spawned = true
export (PackedScene) var mob_scene

func _ready():
	$Sprite.play("not_pressed")
	pass

func _physics_process(_delta):
	if $Player_in.is_colliding():
		$Sprite.play("pressed")	
		pressed = true
	
	if(pressed == true):
		var tilemap = get_parent().get_parent().get_node("TileMap")
		for i in range(21):
			tilemap.set_cell(-1+i,5,-1)
		
	
	

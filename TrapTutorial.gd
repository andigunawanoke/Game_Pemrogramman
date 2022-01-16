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

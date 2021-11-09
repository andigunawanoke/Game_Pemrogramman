extends Node2D

var pressed = false

func _ready():
	$Sprite.play("not_pressed")
	pass

func _physics_process(_delta):
	if $Player_in.is_colliding():
		$Sprite.play("pressed")	
		pressed = true
	if(pressed == true):
		get_parent().get_node("Special_Platform").button_pressed = true

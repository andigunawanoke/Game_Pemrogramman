extends Node2D

var slimebossdeath = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("KinematicBody2D/CollisionShape2D").disabled= true
	get_node("Platform/KinematicBody2D/CollisionShape2D").disabled= true
	get_node("Platform2/KinematicBody2D/CollisionShape2D").disabled= true
	get_node("Platform3/KinematicBody2D/CollisionShape2D").disabled= true
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

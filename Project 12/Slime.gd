extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# va
enum State {
	WALKING,
	DEAD,
}

var _state = State.WALKING
const FLOOR_NORMAL = Vector2.UP
var _velocity = Vector2.ZERO
var speed = Vector2(100,0)
var damage = 10

signal player_hit

onready var platform_detector = $PlatformDetector
onready var floor_detector_left = $FloorDetectorLeft
onready var floor_detector_right = $FloorDetectorRight
onready var sprite = $Sprite


func _ready():
	_velocity.x = speed.x

func _physics_process(_delta):

	if is_on_wall():
		_velocity.x *= -1

	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y




func _on_Area2D_body_entered(body):
	if "MC" in body.name:
		emit_signal("player_hit",damage) # Replace with function body.

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
var damage = 20
var lives = 100
onready var deathtimer = $DeathTimer
onready var healthshowingtimer = $HealthShowingTimer

func _get_lives():
	return lives

func _set_lives(l):
	healthshowingtimer.start()
	
	lives = l
	$Enemy_health_bar/TextureProgress.value = lives
	if(lives <= 0):
		$monster_2.play("death")
		deathtimer.start()
	
func _get_hit(damage):
	_set_lives(_get_lives() - damage) 

signal player_hit

onready var floor_detector_left = $floor_detector_left
onready var floor_detector_right = $floor_detector_right
onready var sprite = $monster_2


func _ready():
	$Enemy_health_bar.hide()
	$Enemy_health_bar/TextureProgress.value = lives
	$monster_2.play("idle")
	_velocity.x = speed.x

func _physics_process(_delta):
	if(healthshowingtimer.is_stopped()):
		$Enemy_health_bar.hide()
	else:
		$Enemy_health_bar.show()
	if(lives <= 0):
		speed = 0
		$Area2D/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		if(deathtimer.is_stopped()):
			queue_free()
	if is_on_wall():
		_velocity.x *= -1

	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y




func _on_Area2D_body_entered(body):
	if "MC" in body.name:
		emit_signal("player_hit",damage) # Replace with function body.

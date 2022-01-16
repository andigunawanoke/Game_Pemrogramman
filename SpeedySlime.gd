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
export var speed = Vector2(100,0)
export var damage = 20
export var lives = 100
var movement = Vector2(0,0)
var gravity = 20
onready var deathtimer = $DeathTimer
onready var healthshowingtimer = $HealthShowingTimer

func _get_lives():
	return lives

func _set_lives(l):
	healthshowingtimer.start()
	lives = l
	$Enemy_health_bar/TextureProgress.value = lives
	speed.x += 6
	if(_velocity.x < 0):
		_velocity.x -= 6
	else:
		_velocity.x += 6
	get_parent().get_parent().get_node("GUIStage1Boss/Control3/Boss_HealthBar/TextureProgress").value = lives
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
	$Enemy_health_bar/TextureProgress.max_value = lives
	$monster_2.play("idle")
	

func _set_speed(a):
	speed.x = a
	_velocity.x = speed.x
	
func _physics_process(_delta):
	if(not is_on_floor()):
		_velocity.y += gravity
	if(healthshowingtimer.is_stopped()):
		$Enemy_health_bar.hide()
	else:
		$Enemy_health_bar.show()
	if(lives <= 0):
		_velocity.x = 0
		_velocity.y = 0
		gravity = 0
		speed = 0
		$Area2D/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		if(deathtimer.is_stopped()):
			get_parent().get_parent().get_node("GUIStage1Boss/Control3/Boss_HealthBar").hide()
			get_parent().get_parent().get_node("GUIStage1Boss/Control3/Slime").hide()
			get_parent().get_parent().get_node("GUIStage1Boss/Control3/Boss_Name").hide()
			var tilemap = get_parent().get_parent().get_node("TileMap")
			tilemap.set_cell(16,37,-1)
			tilemap.set_cell(16,38,-1)
			tilemap.set_cell(16,39,-1)
			tilemap.set_cell(16,40,-1)
			tilemap.set_cell(-2,37,-1)
			tilemap.set_cell(-2,38,-1)
			tilemap.set_cell(-2,39,-1)
			tilemap.set_cell(-2,40,-1)
			tilemap.set_cell(-3,37,-1)
			tilemap.set_cell(-3,38,-1)
			tilemap.set_cell(-3,39,-1)
			tilemap.set_cell(-3,40,-1)
			tilemap.set_cell(-4,37,-1)
			tilemap.set_cell(-4,38,-1)
			tilemap.set_cell(-4,39,-1)
			tilemap.set_cell(-4,40,-1)
			tilemap.set_cell(-4,41,3)
			tilemap.set_cell(-3,41,3)
			tilemap.set_cell(-2,41,3)
			tilemap.set_cell(-1,41,3)
			tilemap.set_cell(0,41,3)
			tilemap.set_cell(1,41,3)
			tilemap.set_cell(2,41,3)
			tilemap.set_cell(3,41,3)
			tilemap.set_cell(4,41,3)
			tilemap.set_cell(-2,42,2)
			tilemap.set_cell(-2,43,2)
			tilemap.set_cell(-2,44,2)
			tilemap.set_cell(-2,45,2)
			tilemap.set_cell(-1,42,2)
			tilemap.set_cell(-1,43,2)
			tilemap.set_cell(-1,44,2)
			tilemap.set_cell(-1,45,2)
			tilemap.set_cell(0,42,2)
			tilemap.set_cell(0,43,2)
			tilemap.set_cell(0,44,2)
			tilemap.set_cell(0,45,2)
			tilemap.set_cell(1,42,2)
			tilemap.set_cell(1,43,2)
			tilemap.set_cell(1,44,2)
			tilemap.set_cell(1,45,2)
			tilemap.set_cell(2,42,2)
			tilemap.set_cell(2,43,2)
			tilemap.set_cell(2,44,2)
			tilemap.set_cell(2,45,2)
			tilemap.set_cell(3,42,2)
			tilemap.set_cell(3,43,2)
			tilemap.set_cell(3,44,2)
			tilemap.set_cell(3,45,2)
			tilemap.set_cell(4,42,2)
			tilemap.set_cell(4,43,2)
			tilemap.set_cell(4,44,2)
			tilemap.set_cell(4,45,2)
			get_parent().get_parent().get_node("Environment/PortalToEndPage").show()
			queue_free()
	if is_on_wall():
		_velocity.x *= -1
	
	if not floor_detector_left.is_colliding():
		_velocity.x = speed.x
	elif not floor_detector_right.is_colliding():
		_velocity.x = -speed.x


	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func _on_Area2D_body_entered(body):
	if "MC" in body.name:
		emit_signal("player_hit",damage) # Replace with function body.

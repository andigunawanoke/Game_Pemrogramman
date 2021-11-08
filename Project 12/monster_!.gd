extends KinematicBody2D

export var speed = 100
export var min_range = -17
export var max_range = 17
export var arah = -1
var rng = RandomNumberGenerator.new()
var _timer = null
var current_number = 0
export var my_random_number = 1
var current_flip = false
var damage = 20
var lives = 100
onready var deathtimer = $Deathtimer
onready var healthshowingtimer = $HealthShowingTimer

func _get_lives():
	return lives

func _set_lives(l):
	healthshowingtimer.start()
	
	lives = l
	print(lives)
	$Enemy_health_bar/TextureProgress.value = lives
	if(lives <= 0):
		$monster_1.play("death")
		deathtimer.start()
		
	
func _get_hit(damage):
	_set_lives(_get_lives() - damage) 

signal player_hit

func _ready():
	$Enemy_health_bar.hide()
	$Enemy_health_bar/TextureProgress.value = lives
	$monster_1.play("idle")
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(4.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _physics_process(delta):
	if(healthshowingtimer.is_stopped()):
		$Enemy_health_bar.hide()
	else:
		$Enemy_health_bar.show()
	if(lives <= 0):
		speed = 0
		min_range = 0
		max_range = 0
		arah = 0
		my_random_number = 0
		$Area2D/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		$monster_1_atas.enabled = false
		$monster_1_bawah.enabled = false
		$monster_1_kiri.enabled = false
		$monster_1_kanan.enabled = false
		if(deathtimer.is_stopped()):
			queue_free()
	var gerakan = Vector2(arah * speed, 0)
	gerakan.y = my_random_number*7
	if(my_random_number > 0):
		gerakan.x = 100
		arah = 1
		$monster_1.flip_h = true
	if(my_random_number < 0):
		gerakan.x = -100
		arah = -1
		$monster_1.flip_h = false
	
	if ($monster_1_atas.is_colliding() or $monster_1_bawah.is_colliding()):
		gerakan.y *= -1
	if ($monster_1_kanan.is_colliding()):
		gerakan.x *= -1
		$monster_1.flip_h = true
	if ($monster_1_kiri.is_colliding()):
		gerakan.x *= -1
		$monster_1.flip_h = false
	move_and_slide(gerakan)
		

func _on_Timer_timeout():
	rng.randomize()
	my_random_number = rng.randf_range(min_range, max_range)
	



func _on_Area2D_body_entered(body):
	if "MC" in body.name:
		emit_signal("player_hit",damage)
	 # Replace with function body.

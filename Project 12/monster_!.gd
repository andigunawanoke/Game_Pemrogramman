extends KinematicBody2D

var speed = 100
var arah = -1
var rng = RandomNumberGenerator.new()
var _timer = null
var current_number = 0
var my_random_number = 1
var current_flip = false
var damage = 15

signal player_hit

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(4.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _physics_process(delta):
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
	my_random_number = rng.randf_range(-17, 17)
	print(my_random_number)



func _on_Area2D_body_entered(body):
	if "MC" in body.name:
		emit_signal("player_hit",damage)
	 # Replace with function body.

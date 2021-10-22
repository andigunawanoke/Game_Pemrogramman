extends KinematicBody2D

var speed = 100
var arah = -1
var rng = RandomNumberGenerator.new()
var _timer = null
var current_number = 0
var my_random_number = 1
var current_flip = false

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
func _physics_process(delta):
	var gerakan = Vector2(arah * speed, 0)
	gerakan.y = my_random_number*10
	if(my_random_number > 0):
		gerakan.x = 100
		arah = 1
		$monster_1.flip_h = true
	if(my_random_number < 0):
		gerakan.x = -100
		arah = -1
		$monster_1.flip_h = false
	
	if(is_on_floor() or is_on_ceiling()):
		gerakan.y = -gerakan.y 
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if(collision):
			gerakan.x = -gerakan.x
			gerakan.y = -gerakan.y
			arah = arah * -1
			$monster_1.flip_h = !$monster_1.flip_h
	move_and_slide(gerakan)
		

func _on_Timer_timeout():
	rng.randomize()
	my_random_number = rng.randf_range(-10, 10)
	print(my_random_number)


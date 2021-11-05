extends KinematicBody2D

var jump_count = 0
var max_speed = 350
var movement = Vector2(0,0)
const axel = 100
const gravity = 20
const jump = -500
var shape_pos
const max_jump = 2
var timeToaddDestination : float
export var lives = 200
var damage = 25

func _get_lives():
	return lives

func _set_lives(l):
	lives = l
	
func _get_hit(damage):
	_set_lives(_get_lives() - damage) 

onready var animation_player = $AnimationPlayer
onready var shoot_timer = $ShootAnimation
onready var sprite = $Sprite
onready var attack_timer = $AttackAnimation
onready var attack_box = $attackboxtimer


signal monsterhit
signal monsterhit2

func _ready():
	shape_pos = $CollisionShape2D.position.x
	pass
#func _input(event):
#	if event.is_action_pressed("Serang"):
#		$AnimatedSprite/Timer.start()
#		$AnimatedSprite.play("Attack")
		
func _physics_process(delta):
	
	if(attack_box.is_stopped()):
		$Area2D/attackbox.disabled = true
	
	if(not is_on_floor()):
		movement.y += gravity
	else:
		movement.x = lerp(movement.x,0,0.2)
		jump_count = 0
	if (Input.is_action_pressed("Maju")):
		movement.x += axel
		movement.x = min(movement.x,max_speed)
		$Area2D/attackbox.position.x = -2.5
		$CollisionShape2D.position.x = shape_pos
		get_node("AnimatedSprite").set_flip_h(false)
	elif (Input.is_action_pressed("Mundur")):
		movement.x -= axel
		movement.x = max(movement.x,-max_speed)
		$Area2D/attackbox.position.x = -137
		$CollisionShape2D.position.x = -shape_pos
		get_node("AnimatedSprite").set_flip_h(true)


	if (Input.is_action_pressed("Atas")):
		movement.y -= axel * 2
		movement.y = max(movement.y,-max_speed)
	elif (Input.is_action_pressed("Bawah")):
		movement.y += axel * 2
		movement.y = min(movement.y,max_speed)
		
	if (Input.is_action_just_pressed("Lompat") and (is_on_floor() or jump_count<max_jump)):
		movement.y = jump
		jump_count = jump_count + 1

	
	move_and_slide(movement,Vector2(0,-1))
	
	
	
	var is_attacking = false
	if (Input.is_action_just_pressed("Serang")):
		is_attacking = true
		$Area2D/attackbox.disabled = false
		attack_box.start()
	var animation = get_new_animation(is_attacking)
	if animation != "idle" and attack_timer.is_stopped():
		if is_attacking:
			attack_timer.start()
		$AnimatedSprite.play(animation)

func get_new_animation(is_attacking = false):
	var animation_new = ""
	if is_on_floor():
		if abs(movement.x) > 24:
			animation_new = "Walk"
		else:
			animation_new = "Idle"
	else:
		if abs(movement.x) > 24:
			animation_new = "Walk"
		else:
			animation_new = "Idle"
			
	if is_attacking:
		animation_new = "Attack"
	return animation_new


func _on_Area2D_body_entered(body):
	if "monster" in body.name:
		emit_signal("monsterhit",damage) # Replace with function body.
	elif "2" in body.name:
		print ("hit")
		emit_signal("monsterhit2",damage)

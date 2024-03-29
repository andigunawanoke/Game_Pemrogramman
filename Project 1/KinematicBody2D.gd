extends KinematicBody2D

var jump_count = 0
var max_speed = 500
var movement = Vector2(0,0)
const axel = 50
const gravity = 25
const jump = -500
var shape_pos
const max_jump = 2

func _ready():
	shape_pos = $CollisionShape2D.position.x
	pass

func _physics_process(delta):
	
	if(not is_on_floor()):
		movement.y += gravity
		
	else:
		movement.x = lerp(movement.x,0,0.2)
		jump_count = 0
	if (Input.is_action_pressed("Maju")):
		movement.x += axel
		movement.x = min(movement.x,max_speed)
		$CollisionShape2D.position.x = shape_pos
		get_node("AnimatedSprite").set_flip_h(false)
		$AnimatedSprite.play("Walk")
	elif (Input.is_action_pressed("Mundur")):
		movement.x -= axel
		movement.x = max(movement.x,-max_speed)
		$CollisionShape2D.position.x = -shape_pos
		get_node("AnimatedSprite").set_flip_h(true)
		$AnimatedSprite.play("Walk_Backward")
	else:
		$CollisionShape2D.position.x = shape_pos
		$AnimatedSprite.play("Idle")
		get_node("AnimatedSprite").set_flip_h(false)
	if (Input.is_action_pressed("Atas")):
		movement.y -= axel * 2
		movement.y = max(movement.y,-max_speed)
	elif (Input.is_action_pressed("Bawah")):
		movement.y += axel * 2
		movement.y = min(movement.y,max_speed)
		
	if (Input.is_action_just_pressed("Lompat") and (is_on_floor() or jump_count<max_jump)):
		movement.y = jump
		jump_count = jump_count + 1

	if(is_on_ceiling()):
		movement.y = 0
		print("on_ceiling")
		
	move_and_slide(movement,Vector2(0,-1))

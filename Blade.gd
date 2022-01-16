class_name Blade
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 1222
# const ShockWave = preload("res://src/Objects/Bullet.tscn") BELUM ADA

onready var sound_shoot = $Shoot
onready var timer = $Cooldown


# This method is only called by Player.gd.
func shoot(direction = 1):
	if not timer.is_stopped():
		return false
	# var bullet = Bullet.instance()
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * BULLET_VELOCITY, 0)

	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	return true

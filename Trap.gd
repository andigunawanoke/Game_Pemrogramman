extends Node2D

var pressed = false
var spawned = true
export (PackedScene) var mob_scene

func _ready():
	$Sprite.play("not_pressed")
	pass

func _physics_process(_delta):
	if $Player_in.is_colliding():
		$Sprite.play("pressed")	
		pressed = true
	
	if(pressed == true):
		if(spawned == true):
			print("SPAWN")
			var mob = mob_scene.instance()
			# Choose a random location on Path2D.
			# We store the reference to the SpawnLocation node.
			var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
			# And give it a random offset.
			mob_spawn_location.unit_offset = randf()
			var player_position = $Player.transform.origin
			add_child(mob)
			mob.initialize(mob_spawn_location.translation, player_position)
			
		spawned = false
	
	

extends Node2D

var current_scene = null
var player_overworld_position = Vector2(100,100) # backup in case of error in finding door

@onready var world = $World
@onready var player = $World/Player

func _ready() -> void:
	load_scene("player_lair")
	#print("player location: " + str(player.position.x) + ", " + str(player.position.y))

func load_scene(scene_name): ### Used on startup or when loading a scene not connected via door
	
	player.hide()
	
	var interior_scene = load(GameManager.levels[scene_name])
	current_scene = interior_scene.instantiate()
	#print(current_scene.name)
	world.add_child(current_scene)
	for door in current_scene.doors:
		#print(door.door_id)
		if door.door_id == scene_name:
			player.position = door.position + door.spawn_point # already uses the doors global position
	
	current_scene.exited.connect(enter_building)
	
	
	
	player.show()

func enter_building(door_id: String): ### Used in regular traversal during gameplay

	player.hide()
	
	### The scene will always have been loaded
	
	var scene_name
	for level in GameManager.level_children: # level is a dictionary with a name and a door array
		#print(level.name)
		if level.name != current_scene.name:
			for door in level.doors: # dictionary containing a door_id and a spawn_point
				if door.door_id == door_id:
					#print("door found\nDoor_id: " + door.door_id + 
					#"\nLevel name: " + level.name)
					scene_name = level.name
					player.position = door.spawn_point
	
	current_scene.queue_free() # deleting the scene safely
	current_scene = null
	
	var interior_scene = load(GameManager.levels[scene_name])
	current_scene = interior_scene.instantiate()
	#print(current_scene.name)
	### Once objects are working, this is where the scene's state will load from GameManager
	
	world.add_child(current_scene)
	
	current_scene.exited.connect(enter_building) # JUST LINKS THE VARIABLES
	# when the current scene sends an exit signal
	
	player.show()

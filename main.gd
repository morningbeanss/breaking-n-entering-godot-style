extends Node2D

var current_scene = null
var player_overworld_position = Vector2(100,100) # backup in case of error in finding door

@onready var world = $World
@onready var player = $World/Player

func _ready() -> void:
	enter_building("player_lair")

func enter_building(door_id: String):

	player.hide()

	if current_scene:
		current_scene.queue_free() # deleting the scene safely
		current_scene = null
		
	var interior_scene = load(GameManager.levels[door_id])
	current_scene = interior_scene.instantiate()
	# once objects are working, this is where the scene's state will load from GameManager
	world.add_child(current_scene)
	
	player.position = player_overworld_position
	for door in current_scene.doors:
		if door.door_id == door_id:
			player.position = door.position + door.spawn_point

	current_scene.exited.connect(enter_building) # JUST LINKS THE VARIABLES
	# when the current scene sends an exit signal
	
	player.show()

extends Node2D

var current_scene = null
var player_overworld_position = Vector2(100,100) # temp

@onready var world = $World
@onready	 var player = $World/Player

# give basic city a better name at some point

# doors contain an ID, which is both an identifiable number
# and an index into the level array
var levels = {
	"overworld": "res://World/basic_city.tscn",
	"player_lair": "res://World/player_lair.tscn"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#player.position = player_overworld_position
	player.hide()
	enter_building("player_lair")

func load_overworld(door_id: String):
	if current_scene:
		#save scene state
		current_scene.queue_free() # deleting the scene safely
		current_scene = null
		#current_scene.hide()
	
	# only has to run once
	if not world.has_node("overworld"):
		var overworld_scene = load(levels["overworld"])
		var overworld = overworld_scene.instantiate()
		overworld.name = "overworld"
		world.add_child(overworld)
		
		
	player.position = player_overworld_position
	for door in world.get_node("overworld").get_children():
		if door.is_in_group("door"):
			if door.door_id == door_id:
				player.position = door.position + door.get_node("SpawnPoint").position
				print("found door, player position: " + str(player.global_position))
		
	player.show()
	
	world.get_node("overworld").show() # we know that the node is there
	world.get_node("overworld").exited.connect(enter_building)


func enter_building(door_id: String):
	print("door ID: " + door_id)
	if player.visible:
		player.hide()
	
	if world.has_node("overworld"):
		world.get_node("overworld").hide()
	
	var interior_scene = load(levels[door_id])
	current_scene = interior_scene.instantiate()
	world.add_child(current_scene)
	
	player.position = current_scene.spawn_point.position# set player's location
	#player.position += Vector2(200, 200)
	print(player.global_position)
	#print("scene position: " + str(current_scene.position))
	current_scene.exited.connect(load_overworld) # JUST LINKS THE VARIABLES
	# when the current scene sends an exit signal
	# return to the main hub
	
	player.show()

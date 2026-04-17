extends Node2D

var current_scene = null
var player_overworld_position = Vector2.ZERO

@onready var world = $World
@onready	 var player = $World/Player

var levels = [
	"res://World/basic_city.tscn",
	"res://World/player_lair.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = player_overworld_position
	
func load_overworld():
	if current_scene:
		current_scene.queue_free()
		current_scene = null
		
	if not $World.has_node("basic_city"):
		var overworld_scene = load(levels[0])
		var overworld = overworld_scene.instantiate()
		world.add_child(overworld)
		
		player.position = player_overworld_position
		player.show()
		
func enter_building(interior_path: String):
	var interior_scene = load(interior_path)
	current_scene = interior_scene.insantiate()
	world.add_child(current_scene)
	
	current_scene.exited.connect(load_overworld)
	
	#set player position
	

	

		

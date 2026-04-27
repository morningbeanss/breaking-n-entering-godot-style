extends Node

### HARDCODED DATA
var level_path_array = [
	"res://World/basic_city.tscn",
	"res://World/player_lair.tscn"
]

var level_name_array = [
	"overworld",
	"player_lair"
]

### FILLED IN DYNAMICALLY DURING LOAD
var interior_states = {}

var levels = {}

var level_children = [] # needs to store door_ids and be indexable 
# avoids dynamic loading

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	### INITIALIZATION
	var init_data
	var init_scene
	for level in level_path_array:
		
		init_data = load(level) 
		init_scene = init_data.instantiate()
		add_child(init_scene)
		var level_name = init_scene.name
		var level_doors = [] # array of door ids
		for door in init_scene.doors:
			level_doors.append(
				{
					"door_id": door.door_id, 
					"spawn_point": door.spawn_point + door.position
				}
			)
		
		level_children.append(
			{
				"name": level_name, # string
				"doors": level_doors # array of dictionaries
			}
		)
		
		levels[level_name] = level
		
		### Once interior states are managed, load the interior state data here
		
		init_scene.queue_free()
		init_scene = null
		init_data = null
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node2D

var current_level = null
var levels = [
	"res://World/basic_city.tscn",
	"res://World/player_lair.tscn"
]
var current_level_index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_level(current_level_index)
	
func load_level(index: int):
	if current_level:
		current_level.queue_free()
		
	var level_scene = load(levels[index])
	
	current_level = level_scene.instantiate()
	$World.add_child(current_level)
	
	current_level.level_completed.connect(_on_level_completed)

func _on_level_completed():
	current_level_index += 1
	
	if current_level_index >= levels.size():
		print("Game Complete!")
	else:
		load_level(current_level_index)
		

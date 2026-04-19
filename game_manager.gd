extends Node


# uses the same key names as levels in main
# honestly levels could just be moved here
var interior_states = {
	"overworld" : {
		
	},
	"player_lair": {
		
	}
}

var levels = {
	"overworld": "res://World/basic_city.tscn",
	"player_lair": "res://World/player_lair.tscn"
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

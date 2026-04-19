extends Node2D

signal exited(door_id: String)
var doors = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child.is_in_group("door"):
			doors.append(child)
			child.entered.connect(_on_door_entered)
	
func _on_door_entered(door_id):
	emit_signal("exited", door_id)

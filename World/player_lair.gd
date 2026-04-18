extends Node2D

@onready var spawn_point = $Door # world position + relative offset

# room state will be stored here eventually

signal exited(door_id) # mirrors door/entered(door_id)

func _on_door_entered(door_id): # bubbling up the door's message to main
	#print("door action received")
	emit_signal("exited", door_id)

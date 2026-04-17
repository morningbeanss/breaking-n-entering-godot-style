extends Node2D

signal exited(door_id: String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_door_entered(door_id): # bubbling up the door's message to main
	print("door action received")
	emit_signal("exited", door_id)

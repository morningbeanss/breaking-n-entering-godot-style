extends Area2D

@export var door_id: String

signal entered(door_id) # will be read in main

func interact():
	print("door interacted with")
	emit_signal("entered", door_id) # player will call interact

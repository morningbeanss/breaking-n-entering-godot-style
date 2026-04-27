extends CharacterBody2D

## VARIABLES
@export var speed = 150
@onready var animated_sprite = $AnimatedSprite2D
var direction: Vector2 = Vector2.ZERO
var current_interactable = null # could represent a door or an item


##METHODS
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
func update_animation() -> void:
	
	if not animated_sprite:
		return
	if direction.length() > 0:
		#movement direction-based animation
		if abs(direction.x) > 0:
			if direction.x > 0:
				animated_sprite.play("robber right")
			else:
				animated_sprite.play("robber left")
		else:
			if direction.y > 0:
				animated_sprite.play("robber front")
			else:
				animated_sprite.play("robber back")
	else:
		#idle animation
		animated_sprite.play("robber idle")

func _process(_delta: float) -> void:
	
	if current_interactable and Input.is_action_just_pressed("interact"): # not yet implemented
		#print("interact pressed")
		current_interactable.interact() # function varies object to object
	update_animation()

func _on_interaction_area_area_entered(area):
	if area.is_in_group("interactable"):
		#print("entered")
		current_interactable = area

func _on_interaction_area_area_exited(area):
	if area.is_in_group("interactable"):
		#print("exited")
		current_interactable = null

extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var speed = 200
@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	update_animation(direction)
	
func update_animation(direction):
	if not animated_sprite:
		return
	if direction.length() > 0:
		#movement direction-based animation
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("robber front")
			else:
				animated_sprite.play("robber front")
		else:
			if direction.y > 0:
				animated_sprite.play("robber front")
			else:
				animated_sprite.play("robber back")
	else:
		#idle animation
		animated_sprite.play("robber front")

extends CharacterBody2D

const MAX_SPEED = 512.0
const JUMP_SPEED = 512.0

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var hor_axis = Input.get_axis("ch_left","ch_right")
	
	velocity.x = MAX_SPEED * hor_axis
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ch_up") and is_on_floor():
		velocity.y = -JUMP_SPEED
	
	move_and_slide()

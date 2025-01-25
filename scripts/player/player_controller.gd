extends CharacterBody2D

const MAX_SPEED = 768.0
const JUMP_SPEED = 1024.0

var axis_cache : float
var hor_axis : float

func _physics_process(_delta: float) -> void:
	hor_axis = Input.get_axis("ch_left","ch_right")
	
	if hor_axis != 0:
		axis_cache = hor_axis
		
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	$Sprite2D.flip_h = false

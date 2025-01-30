extends CharacterBody2D

class_name Player

const MAX_SPEED = 768.0
const JUMP_SPEED = 1024.0

@onready var flash = $FlashTimer

static var instance

var axis_cache : float
var hor_axis : float

static var hp :int = 3
var can_move : bool = true

func _ready() -> void:
	instance = self

func _physics_process(_delta: float) -> void:
	hor_axis = Input.get_axis("ch_left","ch_right")
	
	if hor_axis != 0:
		axis_cache = hor_axis
		
	move_and_slide()


func _on_dash_timer_timeout() -> void:
	$Sprite2D.flip_h = false

func take_damage(damage, knockback_data : PlayerKnockbackData = null):
	hp-=damage
	flash.start()
	if knockback_data != null:
		$MoveMachine.transit('Knockback',{'knockback_data' : knockback_data})
	if hp <= 0:
		$MoveMachine.transit('Death')
		return

func _on_flash_timer_timeout() -> void:
	can_move = true

extends CharacterBody2D

class_name Enemy

signal death
signal death_animation_ended
signal recieve_damage

@export var force := 256.0
@export var hp := 3

var flash_tween : Tween
var invulnerable : bool

func _physics_process(_delta: float) -> void:
	move_and_slide()

func take_damage(amount):
	if hp <= 0 or invulnerable: return
	hp -= amount
	if flash_tween:
		flash_tween.kill()
	flash_tween = create_tween()
	flash_tween.tween_method(set_flash,1.0,0.0,0.1)
	recieve_damage.emit()
	
	if hp <= 0:
		death.emit()

func set_flash(amount):
	material.set_shader_parameter("amount",amount)
	

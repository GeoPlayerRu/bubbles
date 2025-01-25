extends CharacterBody2D

class_name Enemy

signal death
signal death_animation_ended

@export var force := 256.0
@export var hp := 3

var flash_tween : Tween

func _physics_process(_delta: float) -> void:
	move_and_slide()

func take_damage(amount):
	if hp <= 0: return
	hp -= amount
	if flash_tween:
		flash_tween.kill()
	flash_tween = create_tween()
	flash_tween.tween_method(set_flash,1.0,0.0,0.1)
	
	if hp <= 0:
		death.emit()

func set_flash(amount):
	material.set_shader_parameter("amount",amount)

extends CharacterBody2D

class_name Enemy

@export var force := 256.0
@export var hp := 3


func _physics_process(_delta: float) -> void:
	move_and_slide()

func take_damage(amount):
	hp -= amount

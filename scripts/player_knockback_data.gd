extends RefCounted

class_name PlayerKnockbackData

var velocity : Vector2 = Vector2.ZERO
var delay : float = 1.0
var gravity_affected : bool = false

func _init(velocity := Vector2.ZERO, delay := 1.0, gravity_affected := false) -> void:
	self.velocity = velocity
	self.delay = delay
	self.gravity_affected = gravity_affected

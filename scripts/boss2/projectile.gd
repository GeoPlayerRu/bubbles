extends Area2D

const SPEED := 256

var self_correct : bool = true
var direction

func _physics_process(delta: float) -> void:
	if self_correct:
		direction = global_position.direction_to(Player.instance.global_position)
	
	global_position += direction * SPEED * delta

func _on_timer_timeout() -> void:
	self_correct = false


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(1)
		queue_free()


func _on_area_entered(_area: Area2D) -> void:
	queue_free()

extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.velocity = (body.global_position-global_position).normalized() * 1024.0
		body.take_damage(1)

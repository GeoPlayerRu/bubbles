extends Area2D

const knockback := 1536.0

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var knockback = PlayerKnockbackData.new()
		
		knockback.velocity = (body.global_position-global_position).normalized() * 1536.0
		knockback.delay = 0.25
		body.take_damage(1,knockback)

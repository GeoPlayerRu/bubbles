extends State

@onready var attack : Timer = $AttackTimer

func _enter(_message):
	attack.start()
	tree.set_as_subroutine("Move")


func _on_attack_timer_timeout() -> void:
	tree.transit("Move")


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.hp -= 1

extends State

@onready var attack : Timer = $AttackTimer
const attack_sound := preload("res://audio/player_attack.mp3")

func _enter(_message):
	attack.start()
	tree.set_as_subroutine("Move")
	AudioService.play(attack_sound)


func _on_attack_timer_timeout() -> void:
	tree.transit("Move")


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(1)

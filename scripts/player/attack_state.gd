extends State

@onready var player := $"../.."
@onready var attack : Timer = $AttackTimer
const attack_sound := preload("res://audio/player_attack.mp3")

func _enter(_message):
	tree.animation_tree.playback.travel('attack')
	attack.start()
	AudioService.play(attack_sound)
	
	var vector = Input.get_vector("ch_left",'ch_right','ch_down','ch_up')
	if vector == Vector2.ZERO:
		vector = Vector2(player.axis_cache,0)
	tree.animation_tree['parameters/attack/blend_position']=vector


func _on_attack_timer_timeout() -> void:
	tree.transit("NotAttacking")


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.take_damage(1)

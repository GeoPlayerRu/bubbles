extends State

@onready var player := $"../.."
@onready var offwallTimer : Timer = $OffWallTimer


func _enter(_message):
	player.velocity = Vector2(player.MAX_SPEED * sign(player.get_wall_normal().x),-player.JUMP_SPEED)
	offwallTimer.start()


func _on_off_wall_timer_timeout() -> void:
	tree.transit("Move")

extends State

@onready var player := $"../.."
@onready var sprite := $"../../Sprite2D"
@onready var dashTimer : Timer = $DashTimer

func _enter(_message):
	dashTimer.start()
	player.velocity.x = player.axis_cache * player.MAX_SPEED * 1.875
	player.velocity.y = 0
	sprite.flip_h = player.axis_cache == -1


func _on_dash_timer_timeout() -> void:
	tree.transit("Move")
	sprite.flip_h = false

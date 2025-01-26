extends State

var die
@onready var timer := $Timer

func _enter(message):
	timer.start()

func _exit():
	timer.stop()

func _on_timer_timeout() -> void:
	tree.transit('Attack')

extends Node2D

class_name AudioServiceProvider2D

func _ready() -> void:
	AudioService.provider2d = self

func request(stream : AudioStream, at : Vector2) -> AudioStreamPlayer2D:
	var player := AudioStreamPlayer2D.new()
	player.stream = stream
	player.finished.connect(player.queue_free)
	
	get_tree().current_scene.add_child(player)
	player.global_position = at
	player.play()
	return player

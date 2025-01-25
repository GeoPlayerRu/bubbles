extends Node

class_name AudioServiceProvider

func _ready() -> void:
	AudioService.provider = self

func request(stream : AudioStream) -> AudioStreamPlayer:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.finished.connect(player.queue_free)
	
	get_tree().current_scene.add_child(player)
	player.play()
	
	return player

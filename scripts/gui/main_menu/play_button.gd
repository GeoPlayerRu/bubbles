extends Button

const audio := preload("res://audio/v_boi.mp3")
const game_scene := preload("res://scenes/debug_arena.tscn")

func _pressed() -> void:
	await AudioService.play(audio).finished
	get_tree().change_scene_to_packed(game_scene)

extends Button

const audio := preload("res://audio/v_boi.mp3")

func _pressed() -> void:
	await AudioService.play(audio).finished
	get_tree().change_scene_to_file(GlobalVariables.level)
	Player.hp = 3

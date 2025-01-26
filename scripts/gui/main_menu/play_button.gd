extends Button

const audio := preload("res://audio/v_boi.mp3")
const game_scene := "res://scenes/world_"

func _pressed() -> void:
	await AudioService.play(audio).finished
	get_tree().change_scene_to_file(game_scene+str(GlobalVariables.saved_world)+".tscn")
	Player.hp = 3

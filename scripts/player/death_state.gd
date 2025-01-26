extends State


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if active and anim_name == 'death':
		SceneHandler.restart()

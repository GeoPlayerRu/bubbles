extends State

func _enter(_message):
	tree.animation_tree.playback.travel("death")

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'death':
		SceneHandler.restart()

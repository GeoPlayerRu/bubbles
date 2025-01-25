extends Node

var main_scene = ProjectSettings.get("application/run/main_scene")

func change_to_packed(packed : PackedScene):
	get_tree().change_scene_to_packed(packed)

func change_to_file(filename : String):
	get_tree().change_scene_to_file(filename)

func restart():
	change_to_file.call_deferred(main_scene)

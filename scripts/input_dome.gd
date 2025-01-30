extends Node2D

@export var scene : PackedScene
@export var checkpoint : bool

func _on_area_2d_body_entered(_body: Node2D) -> void:
	SceneHandler.change_to_packed(scene)
	
	if checkpoint:
		GlobalVariables.level = scene.resource_path

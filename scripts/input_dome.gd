extends Node2D

@export var scene : PackedScene

func _on_area_2d_body_entered(body: Node2D) -> void:
	SceneHandler.change_to_packed(scene)

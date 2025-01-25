extends Area2D

@export var change_scn : PackedScene

func _on_body_entered(body: Node2D) -> void:
	$Fade.play('fade')
	await $Fade.animation_finished
	SceneHandler.change_to_packed(change_scn)

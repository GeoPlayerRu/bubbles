extends State

const projectile := preload('res://scenes/entities/projectile.tscn')
@onready var data := $"../.."

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if active and anim_name == 'attack':
		spawn_projectile()
		tree.transit('Idle')

func spawn_projectile():
	var proj = projectile.instantiate()
	get_tree().current_scene.add_child(proj)
	
	proj.global_position = data.global_position

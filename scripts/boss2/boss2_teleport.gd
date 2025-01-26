extends State

@onready var data := $"../.."

func _enter(_message):
	data.invulnerable = true

func _exit():
	data.invulnerable = false

func _on_bombaclat_recieve_damage() -> void:
	if not active:
		tree.transit('Teleport')



func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if active and anim_name == 'teleport_begin':
		data.global_position = data.teleport_points[randi_range(0,data.teleport_points.size()-1)].global_position
		tree.transit('Idle')

@tool
extends Line2D

## WARNING: DELETES ALL NODES IN IT
@export_tool_button("Prebake and delete points") var bake = prebake

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	points.clear()
	for child in get_children():
		add_point(to_local(child.global_position))
		if not GlobalVariables.toggle_jiggle:
			child.queue_free()
	if not GlobalVariables.toggle_jiggle:
		set_script(null)

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		return
	for i in get_point_count():
		set_point_position(i,to_local(get_child(i).global_position))

func prebake():
	for child in get_children():
		add_point(child.global_position)
		child.owner = null
		child.queue_free()
		set_script(null)

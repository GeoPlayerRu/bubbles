@tool
extends Line2D

## WARNING: DELETES ALL NODES IN IT
@export_tool_button("Prebake and delete points") var bake = prebake

func _ready() -> void:
	points.clear()
	for child in get_children():
		add_point(child.global_position)

func _process(_delta: float) -> void:
	for i in get_point_count():
		set_point_position(i,get_child(i).global_position)

func prebake():
	for child in get_children():
		add_point(child.global_position)
		child.owner = null
		child.queue_free()
		set_script(null)

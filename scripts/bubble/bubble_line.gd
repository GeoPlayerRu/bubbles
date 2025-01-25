extends Line2D

func _ready() -> void:
	for child in get_children():
		add_point(child.global_position)

	

func _process(_delta: float) -> void:
	for i in get_point_count():
		set_point_position(i,get_child(i).global_position)

extends Polygon2D

@onready var inner_line : Line2D = $InnerLine
@onready var outer_line : Line2D = $OuterLine
@onready var floor_line : Line2D = $FloorLine


func _ready() -> void:
	update_poly()
	
	

func _process(_delta: float) -> void:
	update_poly()

func update_poly():
	var poly : PackedVector2Array
	
	for i in inner_line.get_point_count():
		poly.append(inner_line.get_point_position(i))
	
	for i in outer_line.get_point_count():
		poly.append(outer_line.get_point_position(outer_line.get_point_count()-i-1))
	polygon = poly

extends Control

class_name DNDOut

const preview_gui = preload("res://scenes/gui/preview.tscn")

@export var equipment : Equipment
@onready var holder := $HoldedTexture
@onready var category : Equipment.Categories = equipment.category

var dragging = false
var avaiable = true

func _ready() -> void:
	holder.texture = equipment.preview
	equipment.linked_out = self

func _get_drag_data(at_position: Vector2) -> Variant:
	if not avaiable: return
	
	avaiable = false
	holder.texture = null
	dragging = true
	var preview = preview_gui.instantiate()
	preview.texture = equipment.preview
	preview.size = holder.size
	set_drag_preview(preview)
	
	return equipment

func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and dragging:
		dragging = false
		if not is_drag_successful():
			holder.texture = equipment.preview
			avaiable = true

func return_data():
	avaiable = true
	holder.texture = equipment.preview

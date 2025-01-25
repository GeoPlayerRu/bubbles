extends Control

const preview_gui = preload("res://scenes/gui/preview.tscn")

@export var equipment : Equipment
@export var category : Equipment.Categories
@onready var holder := $HoldedTexture

var dragging = false

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Equipment:
		return data.category == category or category == Equipment.Categories.UNIVERSAL
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if equipment != null:
		equipment.linked_out.return_data()
	
	equipment = data
	holder.texture = equipment.preview

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			equipment.linked_out.return_data()
			equipment = null
			holder.texture = null

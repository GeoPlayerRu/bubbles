extends Control

@export var positive_x := "ch_right"
@export var negative_x := "ch_left"
@export var positive_y := "ch_down"
@export var negative_y := "ch_up"

@export var jump := "ch_jump"

#@onready var joystick := $Joystick
@onready var canvas_transform = get_viewport().get_screen_transform().affine_inverse()
var bound_id : int = -1

func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.canceled and bound_id == event.index:
			return
		if bound_id != -1:
			return
		var click_pos = event.position
		if position < click_pos and position + size > click_pos:
			bound_id = event.index
			set_joystick_position(click_pos * canvas_transform)
	
	if event is InputEventScreenDrag:
		if bound_id == event.index:
			set_joystick_position(event.position * canvas_transform)

func set_joystick_position(click_pos : Vector2):
	print(position + click_pos)
	#if abs(click_pos.x-128) < 128:
	#	joystick.position.x = click_pos.x - joystick.size.x/2.0
	#if abs(click_pos.y-128) < 128:
	#	joystick.position.y = click_pos.y - joystick.size.y/2.0

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.canceled and bound_id == event.index:
			bound_id = -1
			#joystick.position = joystick.size

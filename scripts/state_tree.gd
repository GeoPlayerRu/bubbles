extends Node

class_name StateTree

@export var current_state : State
var states : Dictionary[String,State]
var subroutine : State

func _ready() -> void:
	for child in get_children():
		states[child.name] = child
		child.tree = self
	
	
	current_state.active = true
	current_state._enter({})

func _process(delta: float) -> void:
	current_state._update(delta)
	if subroutine != null:
		subroutine._update(delta)

func _physics_process(delta: float) -> void:
	current_state._physics_update(delta)
	if subroutine != null:
		subroutine._physics_update(delta)

func transit(to : String,message : Dictionary = {}) -> void:
	subroutine = null
	current_state._exit()
	current_state.active = false
	current_state = states[to]
	current_state._enter(message)
	current_state.active = true
	

func get_current_state() -> State:
	return current_state

func get_current_state_name() -> String:
	return current_state.name

func set_as_subroutine(subroutine_name : String):
	subroutine = states[subroutine_name]
	subroutine._enter({"subroutine" : true})

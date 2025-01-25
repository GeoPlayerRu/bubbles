extends Node

class_name StateTree

@export var current_state : State
var states : Dictionary[String,State]

func _ready() -> void:
	for child in get_children():
		states[child.name] = child
		child.tree = self

func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._physics_update(delta)

func transit(to : String,message : Dictionary = {}) -> void:
	current_state._exit()
	current_state = states[to]
	current_state._enter(message)

func get_current_state() -> State:
	return current_state

func get_current_state_name() -> String:
	return current_state.name

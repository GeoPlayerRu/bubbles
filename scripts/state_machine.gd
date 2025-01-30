extends Node

class_name StateMachine

signal state_entered(state_name : StringName)
signal state_exited(state_name : StringName)
signal transited(from : StringName, to : StringName)


@export var current_state : State
@export var animation_tree : CSMAnimationTree
var states : Dictionary[StringName,State]

func _ready() -> void:
	for child in get_children():
		states[child.name] = child
		child.tree = self
	
	current_state.active = true
	current_state._enter({})

func _process(delta: float) -> void:
	current_state._update(delta)

func _physics_process(delta: float) -> void:
	current_state._physics_update(delta)

func transit(to : StringName,message : Dictionary = {}) -> void:
	var from = current_state.name
	
	current_state._exit()
	current_state.active = false
	state_exited.emit(from)
	
	current_state = states[to]
	
	current_state._enter(message)
	current_state.active = true
	state_entered.emit(to)
	
	transited.emit(from, to)

func get_current_state() -> State:
	return current_state

func get_current_state_name() -> StringName:
	return current_state.name

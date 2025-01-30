extends AnimationTree

## Animation Tree for custom State Machine
class_name CSMAnimationTree

## Mappings from animation names to state
@export var animation_to_state_mapping : Dictionary[StringName, StringName]
@export var state_machine : StateMachine

var playback : AnimationNodeStateMachinePlayback = self["parameters/playback"]

func _on_animation_finished(anim_name : StringName):
	if animation_to_state_mapping.has(anim_name):
		state_machine.transit(animation_to_state_mapping[anim_name])

func set_condition(condition : String, value : bool):
	self['parameters/conditions/%s' % condition] = value

func enable_condition(condition : String):
	set_condition(condition,true)

func disable_condition(condition : String):
	set_condition(condition, false)

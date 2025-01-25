extends AnimationTree

@onready var player := $".."
@onready var state_machine := $"../StateMachine"
var prev_grounded : bool
var prev_falling : bool


func _physics_process(_delta: float) -> void:
	var falling : bool
	var grounded : bool
	
	grounded = player.is_on_floor()
	falling = player.velocity.y > 0 and not grounded
	
	set('parameters/conditions/falling',falling)
	set('parameters/conditions/ground',prev_falling == true and prev_grounded == false and grounded)
	set('parameters/Attack/blend_position',Input.get_vector("ch_left",'ch_right','ch_up','ch_down'))
	
	if state_machine.get_current_state_name() == "Move" and state_machine.get_current_state().jumped:
		get('parameters/playback').start('jump')
	
	if state_machine.get_current_state_name() == "Dash" and get('parameters/playback').get_current_node() != 'dash':
		get('parameters/playback').start('dash')
	
	prev_grounded = grounded
	prev_falling = falling

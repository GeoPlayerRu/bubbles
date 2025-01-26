extends AnimationTree

@onready var player := $".."
@onready var state_machine := $"../StateMachine"
var prev_grounded : bool
var prev_falling : bool


func _physics_process(_delta: float) -> void:
	var falling : bool
	var grounded : bool
	var playback = get('parameters/playback')
	
	grounded = player.is_on_floor()
	falling = player.velocity.y > 0 and not grounded
	
	set('parameters/conditions/falling',falling)
	set('parameters/conditions/ground',prev_falling == true and prev_grounded == false and grounded)
	
	if state_machine.get_current_state_name() == "Move" and ((player.velocity.y < 0 and playback.get_current_node() != 'jump') or state_machine.get_current_state().jumped):
		playback.start('jump')
	
	if state_machine.get_current_state_name() == "Dash" and playback.get_current_node() != 'dash':
		playback.start('dash')
	
	if state_machine.get_current_state_name() == "Death" and playback.get_current_node() != 'death':
		playback.start('death')
	
	if state_machine.get_current_state_name() == "Attack" and playback.get_current_node() != 'attack':
		var vector = Input.get_vector("ch_left",'ch_right','ch_down','ch_up')
		if vector == Vector2.ZERO:
			vector = Vector2(player.axis_cache,0)
		set('parameters/attack/blend_position',vector)
		playback.start('attack')
		
	
	prev_grounded = grounded
	prev_falling = falling

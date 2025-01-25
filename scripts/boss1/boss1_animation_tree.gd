extends AnimationTree

@onready var data := $".."
@onready var state_machine := $"../StateTree"
var prev_grounded : bool
var prev_falling : bool
var die : bool

func _physics_process(_delta: float) -> void:
	if die: return
	
	var falling : bool
	var grounded : bool
	var playback = get('parameters/playback')
	
	grounded = data.is_on_floor()
	falling = data.velocity.y > 0 and not grounded
	
	set('parameters/conditions/fall',falling)
	set('parameters/conditions/ground',prev_falling == true and prev_grounded == false and grounded)
	
	if state_machine.get_current_state_name() != "Idle" and playback.get_current_node() == 'idle':
		playback.start('jump')
	
	prev_falling = falling
	prev_grounded = grounded


func _on_bleb_death() -> void:
	die = true
	get('parameters/playback').start('death')


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'death':
		data.death_animation_ended.emit()
		data.queue_free()

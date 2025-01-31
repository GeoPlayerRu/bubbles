extends AnimationTree

@onready var data := $".."
@onready var state_machine := $"../StateTree"

func _process(_delta: float) -> void:
	return
	var playback = get('parameters/playback')
	
	if state_machine.get_current_state_name() == "Attack" and playback.get_current_node() == 'idle':
		playback.start('attack')
	
	if state_machine.get_current_state_name() == "Teleport" and playback.get_current_node() == 'idle':
		playback.start('teleport_begin')


func _on_bombaclat_death() -> void:
	get('parameters/playback').start('death')
	
func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'death':
		data.death_animation_ended.emit()
		data.queue_free()

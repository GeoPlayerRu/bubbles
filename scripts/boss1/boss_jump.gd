extends State

@export var fly_time := 2
@export var height := 512

@onready var data := $"../.."

func _physics_update(delta: float) -> void:
	data.velocity.y += delta * GlobalVariables.gravity

func jump():
	if not active:
		return
	var distance_to_player = Player.instance.global_position.x - data.global_position.x
	
	data.velocity = Vector2(distance_to_player/fly_time,-(2*height+GlobalVariables.gravity*0.25*fly_time*fly_time)/(fly_time))

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if not active:
		return
	if anim_name == 'grounding':
		data.velocity = Vector2.ZERO
		tree.transit('Idle')

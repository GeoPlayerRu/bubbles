extends State

@onready var data := $"../.."
var mult := 1.0

func _physics_update(delta: float) -> void:
	data.velocity.y += delta * GlobalVariables.gravity * mult

func smash_sequence() -> void:
	mult = 0.0
	if not active: return
	var tween := create_tween()
	tween.tween_property(data,"global_position:x",Player.instance.global_position.x,0.5)
	tween.parallel().tween_property(data,"global_position:y",Player.instance.global_position.y-512.0,0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	tween.chain().tween_callback(set.bind('mult',4.0))

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if not active:
		return
	if anim_name == 'grounding':
		data.velocity = Vector2.ZERO
		tree.transit('Idle')

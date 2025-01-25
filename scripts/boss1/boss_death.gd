extends State

@onready var data := $"../.."

func _on_bleb_death() -> void:
	tree.transit('Death')

func _physics_update(delta: float) -> void:
	data.velocity.y += delta * GlobalVariables.gravity

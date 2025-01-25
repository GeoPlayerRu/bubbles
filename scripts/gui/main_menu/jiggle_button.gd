extends CheckButton

func _toggled(toggled_on: bool) -> void:
	GlobalVariables.toggle_jiggle = toggled_on

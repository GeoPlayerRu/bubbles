extends CheckButton

func _ready() -> void:
	button_pressed = GlobalVariables.toggle_jiggle

func _toggled(toggled_on: bool) -> void:
	GlobalVariables.toggle_jiggle = toggled_on

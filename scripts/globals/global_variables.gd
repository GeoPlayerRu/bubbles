extends Node

var toggle_jiggle : bool = true
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var level := "res://scenes/levels/world_1.tscn"

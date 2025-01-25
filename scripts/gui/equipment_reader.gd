extends GridContainer

const DIRECTORY = "res://resources/"
const DNDOUT = preload("res://scenes/gui/dn_d_out.tscn")

func _ready() -> void:
	for file in DirAccess.get_files_at(DIRECTORY):
		var out = DNDOUT.instantiate()
		var equip =  load(DIRECTORY+file)
		out.equipment = equip
		add_child(out)

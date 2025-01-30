extends Camera2D

@export var bomboclat : Enemy
var died : bool = false

func _process(_delta: float) -> void:
	if died: return
	global_position = (bomboclat.global_position + Player.instance.global_position)/2.0
	zoom = Vector2(1280.0/abs(bomboclat.global_position.x-Player.instance.global_position.x),720.0/abs(bomboclat.global_position.y-Player.instance.global_position.y))
	var mid = min(min(zoom.x,zoom.y),1.0)
	zoom =  Vector2(mid-0.1,mid-0.1)


func _on_bombaclat_death() -> void:
	reparent(Player.instance)
	zoom = Vector2(0.5,0.5)
	died = true
	position = Vector2.ZERO

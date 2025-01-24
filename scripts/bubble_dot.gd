extends Area2D

class_name BubbleDot

var displace_amount : float
var delta_displace : float
var overlapping_body_count : int
var modified : bool = false
var tween : Tween
@onready var start_position : Vector2 = global_position
@export var displace_position : Vector2 = Vector2.INF
@export var first_near : BubbleDot
@export var second_near : BubbleDot


func set_displace(value : float):
	if modified: return
	delta_displace = value - displace_amount
	displace_amount = value
	modified = true
	update_displace()

func add_displace(value : float):
	if modified: return
	displace_amount += value
	delta_displace = value
	modified = true
	update_displace()
	
func update_displace():
	if tween:
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self,"global_position",start_position*(1-displace_amount)+displace_position*displace_amount,1)
	if first_near:
		first_near.add_displace(delta_displace/2.0)
	if second_near:
		second_near.add_displace(delta_displace/2.0)

func _process(_delta: float) -> void:
	modified = false

func _on_body_entered(body: Node2D) -> void:
	if overlapping_body_count == 0:
		set_displace(1.0)
	overlapping_body_count+=1


func _on_body_exited(body: Node2D) -> void:
	if overlapping_body_count == 1:
		set_displace(0.0)
	overlapping_body_count-=1

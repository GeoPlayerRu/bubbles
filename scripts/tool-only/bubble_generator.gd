@tool
extends CollisionPolygon2D

const dot = preload("res://scenes/bubble_dot.tscn")
const dotradius = 32

@export var dot_cache : Array[BubbleDot]

@export var radius : float
@export var thickness : float
@export var steps : int

@export_tool_button("Generate shape") var gen_shape = generate_bubble

func generate_bubble():
	if dot_cache.size() > 0:
		for dot in dot_cache: 
			dot.queue_free()
		dot_cache.clear()
		
	var poly : PackedVector2Array
	
	## Inner points
	for i in range(steps+1):
		var angle = -(float(i)/float(steps))*PI
		poly.append(Vector2(cos(angle)*radius,sin(angle)*radius))
	
	#Outer points
	for i in range(steps+1):
		var angle = -(float(steps-i)/float(steps))*PI
		poly.append(Vector2(cos(angle)*(radius+thickness),sin(angle)*(radius+thickness)))
	
	polygon = poly
	
	var dot_count = radius*PI / (dotradius*2)
	for i in range(dot_count + 2):
		var indot = dot.instantiate(1)
		dot_cache.append(indot)
		get_tree().edited_scene_root.add_child(indot,true, Node.InternalMode.INTERNAL_MODE_DISABLED)
		indot.set_owner(get_tree().edited_scene_root)
		
		var angle = -(float(i)/float(dot_count))*PI
		indot.global_position = Vector2(cos(angle)*(radius-dotradius),sin(angle)*(radius-dotradius))
		indot.displace_position = Vector2(cos(angle)*radius,sin(angle)*radius)
	
	for i in range(dot_cache.size()):
		if i != 0:
			dot_cache[i].first_near = dot_cache[i-1]
		if i < dot_cache.size()-1:
			dot_cache[i].second_near = dot_cache[i+1]
	

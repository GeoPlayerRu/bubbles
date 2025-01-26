@tool
extends CollisionPolygon2D

const dot = preload("res://scenes/bubble_dot.tscn")
const dotradius = 16

@export var dot_cache : Array[BubbleDot]

@export var radius : float
@export var thickness : float
@export var steps : int

@export_tool_button("Generate shape") var gen_shape = generate_bubble

func generate_bubble():
	if dot_cache.size() > 0:
		for cdot in dot_cache: 
			cdot.queue_free()
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
	
	#inner halfcircle
	var inner_folder = Node.new()
	get_tree().edited_scene_root.add_child(inner_folder)
	inner_folder.set_owner(get_tree().edited_scene_root)
	inner_folder.name = 'Inner'
	
	var dot_count = radius*PI / (dotradius*2)
	for i in range(dot_count + 1):
		var indot = dot.instantiate()
		dot_cache.append(indot)
		inner_folder.add_child(indot,true, Node.InternalMode.INTERNAL_MODE_DISABLED)
		indot.set_owner(get_tree().edited_scene_root)
		
		var angle = -(float(i)/float(dot_count))*PI
		indot.global_position = Vector2(cos(angle)*(radius-dotradius),sin(angle)*(radius-dotradius))
		indot.displace_position = indot.to_local(Vector2(cos(angle)*radius,sin(angle)*radius))
	
	#floor
	var floor_folder = Node.new()
	get_tree().edited_scene_root.add_child(floor_folder)
	floor_folder.set_owner(get_tree().edited_scene_root)
	floor_folder.name = 'Floor'
	
	for i in range(1, radius/dotradius):
		var indot = dot.instantiate()
		dot_cache.append(indot)
		floor_folder.add_child(indot,true, Node.InternalMode.INTERNAL_MODE_DISABLED)
		indot.set_owner(get_tree().edited_scene_root)
		
		indot.global_position = Vector2(-radius+2*i*dotradius,-dotradius)
		indot.displace_position = indot.to_local(Vector2(indot.global_position.x,indot.global_position.y+dotradius))
	
	#outer halfcircle
	var outer_folder = Node.new()
	get_tree().edited_scene_root.add_child(outer_folder)
	outer_folder.set_owner(get_tree().edited_scene_root)
	outer_folder.name = 'Outer'
	
	var outer_count = (radius+thickness)*PI / (dotradius*2)
	for i in range(outer_count + 1):
		var indot = dot.instantiate()
		dot_cache.append(indot)
		outer_folder.add_child(indot,true, Node.InternalMode.INTERNAL_MODE_DISABLED)
		indot.set_owner(get_tree().edited_scene_root)
		
		var angle = -(float(i)/float(outer_count))*PI
		indot.global_position = Vector2(cos(angle)*(radius+thickness+dotradius),sin(angle)*(radius+thickness+dotradius))
		indot.displace_position = indot.to_local(Vector2(cos(angle)*(radius+thickness),sin(angle)*(radius+thickness)))
	

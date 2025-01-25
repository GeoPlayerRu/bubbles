extends State

@onready var jumpBuffer : Timer = $JumpBuffer
@onready var floorBuffer : Timer = $FloorBuffer
@onready var wallBuffer : Timer = $WallBuffer
@onready var player := $"../.."
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var dashCooldownTimer : Timer = $DashCooldown


var jumped : bool = false
var can_dash : bool = true


func _physics_update(delta):
	player.velocity.x = player.hor_axis * player.MAX_SPEED
	
	if player.is_on_floor():
		floorBuffer.start()
		can_dash = true
	
	if player.is_on_wall():
		wallBuffer.start()
		can_dash = true
	
	player.velocity.y += gravity * delta
	
	jumped = false
	if Input.is_action_just_pressed("ch_jump") or jumpBuffer.time_left > 0:
		if player.is_on_floor() or floorBuffer.time_left > 0:
			player.velocity.y = -player.JUMP_SPEED
			jumpBuffer.stop()
			floorBuffer.stop()
			jumped = true
		elif player.is_on_wall() or wallBuffer.time_left > 0:
			tree.transit("OffwallJump")
			jumpBuffer.stop()
			wallBuffer.stop()
			jumped = true
		elif jumpBuffer.time_left == 0:
			jumpBuffer.start()
	
	if can_dash and Input.is_action_just_pressed("ch_dash") and dashCooldownTimer.time_left == 0:
		tree.transit("Dash")
		dashCooldownTimer.start()
		can_dash = false

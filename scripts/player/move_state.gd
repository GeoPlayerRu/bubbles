extends State

@onready var jumpBuffer : Timer = $JumpBuffer
@onready var floorBuffer : Timer = $FloorBuffer
@onready var wallBuffer : Timer = $WallBuffer
@onready var player := $"../.."
@onready var dashCooldownTimer : Timer = $DashCooldown


var jumped : bool = false
var can_dash : bool = true
var subroutine : bool = false

func _enter(message):
	subroutine = message.has("subroutine")
	$"../../Sprite2D".flip_h = false

func _physics_update(delta):
	if player.can_move:
		player.velocity.x = player.hor_axis * player.MAX_SPEED
	
	if player.is_on_floor():
		floorBuffer.start()
		can_dash = true
	
	if player.is_on_wall():
		wallBuffer.start()
		can_dash = true
	
	player.velocity.y += GlobalVariables.gravity * delta
	
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
	
	if can_dash and Input.is_action_just_pressed("ch_dash") and dashCooldownTimer.time_left == 0 and not subroutine:
		tree.transit("Dash")
		dashCooldownTimer.start()
		can_dash = false
	
	if Input.is_action_just_pressed("ch_melee") and not subroutine:
		tree.transit("Attack")

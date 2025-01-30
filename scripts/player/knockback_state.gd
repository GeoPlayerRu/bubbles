extends State

var gravity_affected : bool
@onready var timer := $Timer

func _enter(message) -> void:
	if message.has('knockback_data') and message['knockback_data'] is PlayerKnockbackData:
		var data = message['knockback_data']
		timer.wait_time = data.delay
		gravity_affected = data.gravity_affected
		tree.get_parent().velocity = data.velocity
		
		timer.start()

func _physics_update(delta):
	if gravity_affected:
		tree.get_parent().velocity.y += GlobalVariables.gravity

func _on_timer_timeout() -> void:
	tree.transit('Move')
	gravity_affected = false

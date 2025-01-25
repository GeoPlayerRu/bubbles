extends State

enum{
	JUMP = 0,
	SMASH = 1
}

@onready var timer := $DecisionTimer
@onready var data := $"../.."
var decision : int = -1
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func _enter(_message):
	decision = rng.rand_weighted([2,1])
	
	match decision:
		JUMP:
			timer.wait_time = randf_range(1,2.5)
		SMASH:
			timer.wait_time = randf_range(1.75,3.25)
	timer.start()

func _physics_update(delta: float) -> void:
	data.velocity.y += delta * GlobalVariables.gravity

func _on_decision_timer_timeout() -> void:
	match decision:
		JUMP:
			tree.transit('Jump')
		SMASH:
			tree.transit('Smash')

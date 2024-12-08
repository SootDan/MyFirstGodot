extends RigidBody3D

@export var oscillation_speed := 2.0
@export var drift := 2.5
@export var y_min := 5.0
@export var y_max := 40.0
var can_swim := true
var time_delta := 0.0


func _integrate_forces(state):
	time_delta += state.step
	var upwards_drift: float
	
	if position.y < y_min:
		upwards_drift = 1.0
	elif position.y > y_max:
		upwards_drift = -5.0
	else:
		upwards_drift = randf_range(-5, 5)
	
	var random_drift := Vector3(
			randf(),
			upwards_drift,
			0
		) * drift
		
	if can_swim:
		apply_force(random_drift)
		time_delta = 0


func _on_timer_timeout() -> void:
	can_swim = not can_swim
	$Timer.start()

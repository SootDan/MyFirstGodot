extends Node3D

@export var speed := 3.0
var can_swim := false

func _physics_process(delta: float) -> void:
	if can_swim and position.y <= 25.0:
		position.y += 1.5 * speed * delta
	if can_swim:
		position.x += speed * delta


func _on_timer_timeout() -> void:
	can_swim = not can_swim
	$Timer.start()

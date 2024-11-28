extends CharacterBody3D

@export var speed := 1.0
@export var rotation_speed := 5
@export var fall_acceleration := 150.0
@onready var start_y := position.y


func _physics_process(delta):
	var direction := Vector3.ZERO
	
	if Input.is_action_pressed("Right"):
		rotation.y -= rotation_speed * delta
	if Input.is_action_pressed("Left"):
		rotation.y += rotation_speed * delta
	if Input.is_action_pressed("Forward"):
		direction.z = -sin(rotation.y) * speed
		direction.x = cos(rotation.y) * speed
	if Input.is_action_pressed("Backward"):
		direction.z = sin(rotation.y) * speed
		direction.x = -cos(rotation.y) * speed

	if Input.is_action_pressed("Jump") and is_on_floor():
		direction.y += speed * 15
	
	if not is_on_floor():
		direction.y -= fall_acceleration * delta
	velocity = direction * speed
	move_and_slide()

extends Actor

# this callback is called after the one in Actor.gd, it does not
# overwrite the other one.

# use this over _process for anything that needs to detect collision
func _physics_process(delta: float) -> void:
	# _velocity.y will be negative if play is currently jumping
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, UP_DIRECTION)


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)


func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
) -> Vector2:
	var move_velocity: = linear_velocity
	move_velocity.x = speed.x * direction.x
	move_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		move_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		move_velocity.y = 0.0
	return move_velocity

extends CharacterBody2D

var hp = 3
var max_hp = 3
var is_dead = false


const SPEED = 1330.0
const JUMP_VELOCITY = -800.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*2
var jump_count = 0
var max_jumps = 2
func _physics_process(delta):
	# Add the gravity.
	if hp<=0:
		is_dead = true
	if is_dead == true:
		queue_free()
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("p2_up") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	if Input.is_action_just_pressed("p2_down"):
		velocity.y=-JUMP_VELOCITY*5
	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("p2_left", "p2_right")



	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

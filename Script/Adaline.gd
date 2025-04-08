extends CharacterBody2D



const SPEED = 1000
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var number_of_jumps = 0
var max_jumps =2

func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		number_of_jumps = 0

	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("p1_up") and number_of_jumps < max_jumps:
		velocity.y = JUMP_VELOCITY
		number_of_jumps += 1
			

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("p1_left", "p1_right")


	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

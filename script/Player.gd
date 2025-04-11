extends CharacterBody2D
class_name Player

var hp = 3
var max_hp = 3
var is_dead = false

var JUMP_VELOCITY = -100.0
var SPEED = 1030.0


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


	move_and_slide()


class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

@export var player: String
@export var hp: int = 100
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionShape:CollisionShape2D = $CollisionShape2D

var dropYPos = null

func _physics_process(delta):
	#print(dropYPos, "  ", position.y)
	if dropYPos != null and position.y > dropYPos + 32:
		dropYPos = null
		$CollisionShape2D.disabled = false
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(player + "_a") and is_on_floor():
		if Input.is_action_pressed(player + "_down"):
			$CollisionShape2D.disabled = true
			dropYPos = position.y
		else:
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(player + "_left", player + "_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation()
	move_and_slide()
	
	
func update_animation():
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
	if velocity.x != 0:
		sprite.play("walk")
	else:
		sprite.play("stand")


func _on_area_2d_area_entered(area):
	if area is Trap:
		self.hp -= area.damage

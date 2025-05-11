class_name Player
extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var collisionShape = $CollisionShape2D
@onready var flame = preload("res://scenes/flame.tscn")
var flame_instance = null

@export var player = "p1"
@export var hp: int = 100
@export var SPEED = 1000.0
@export var JUMP_VELOCITY = -2400.0
var score = 100
var dropYPos = null
var changeAnimation = true
var can_move = true
func _physics_process(delta):
	var direction = Input.get_axis(player + "_left", player + "_right")

	#print(dropYPos, "  ", position.y)
	if dropYPos != null and position.y > dropYPos + 34:
		dropYPos = null
		$CollisionShape2D.disabled = false
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta *2

	# Handle jump.
	#print(player, is_on_floor())
	if Input.is_action_just_pressed(player + "_a") and is_on_floor():
		if Input.is_action_pressed(player + "_down"):
			$CollisionShape2D.disabled = true
			dropYPos = position.y
		else:
			velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed(player + "_x") and is_on_floor():
		print("spawn_flame")
		spawn_flame()
		sprite.play("atacking")
		changeAnimation=false
		can_move=false
	else:
		despawn_flame()
		changeAnimation=true
		can_move=true
	if can_move!=true:
		direction = 0
		velocity.x = 0
		velocity.y = 0
	else:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		

	if changeAnimation == true:
		update_animation()
	move_and_slide()
	
	# print("%s position %s, %s" % [player, position.x, position.y])

	

func update_animation():
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
		
	if velocity.x != 0:
		sprite.play("walk")
	else:
		sprite.play("stand")

func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		die()

func die():
	get_tree().change_scene_to_file("res://scenes/death.tscn")


func spawn_flame():
	if flame_instance == null:
		print("creating flame instance")
		flame_instance = flame.instantiate()
		add_child(flame_instance)
		
		if sprite.flip_h:
			flame_instance.get_child(0).flip_h = true
			if player == "p1":
				flame_instance.position = Vector2(-450, -300) 
			else:
				flame_instance.position = Vector2(-850, -100)
			flame_instance.direction = Vector2.LEFT  
		else:
			if player == "p1":
				flame_instance.position = Vector2(1000, -300) 
			else:
				flame_instance.position = Vector2(1000, -100)
			flame_instance.direction = Vector2.RIGHT  
		
		
func despawn_flame():
	if flame_instance != null:
		remove_child(flame_instance)
		flame_instance = null
		

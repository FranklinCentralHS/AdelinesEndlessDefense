extends Node2D
class_name enemy

# Import the Player class
const Player = preload("res://script/Player.gd")

var hp=1

const SPEED = 900

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = 1
	if ray_cast_left.is_colliding():
		direction = -1
	check_dead()
	position.x += direction * SPEED * delta

func check_dead():
	if hp<=0:
		queue_free()

func _on_Enemy_body_entered(body):
	if body is Player:
		body.hp -= 1

extends Node2D
class_name enemy

const SPEED = 60
@export var stats : Resource

var direction = 1
@onready var sprite = $Sprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down = $RayCastDown
@export var points:int = 10
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		sprite.flip_h = true
	elif ray_cast_left.is_colliding():
		direction = 1
		sprite.flip_h = false


	# Check if there's ground in front
	if not ray_cast_down.is_colliding():
		direction *= -1
		sprite.flip_h = not sprite.flip_h
		position.x += direction * 10

			
	 
	position.x += direction * SPEED * delta * 3


func _on_area_2d_body_entered(body):
	if body is Player:
		pass

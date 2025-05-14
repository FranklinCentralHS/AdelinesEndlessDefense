extends Resource

@export var damage = 100
@export var SPEED = 60


func _on_area_2d_body_entered(body):
	if body is Player:
		body.take_damage(damage)

extends enemy

@export var points = 30
func _on_area_2d_body_entered(body):
	if body is Player:
		body.take_damage(20)

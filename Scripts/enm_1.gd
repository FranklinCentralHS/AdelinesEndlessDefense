extends enemy

func _on_area_2d_body_entered(body):
	if body is Player:
		body.take_damage(damage)

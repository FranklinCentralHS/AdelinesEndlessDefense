extends Area2D


func _on_area_entered(area):
	var body = area.get_parent()
	if body is Player:
		body.take_damage(500)

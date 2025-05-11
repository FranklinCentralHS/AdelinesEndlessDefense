extends Area2D

@export var SPEED = 40
var direction = Vector2.RIGHT



func _on_area_entered(area):
	var body=area.get_parent()
	if body is enemy:
		body.queue_free()
		Global.kill_points += body.points
		Global.enemy_killed.emit()

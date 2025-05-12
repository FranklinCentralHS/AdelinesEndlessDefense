extends Node2D




func _input(event):
	if event.is_action_pressed("p1_start"):
		_on_start_pressed()
	if event.is_action_pressed("p2_start"):
		_on_start_pressed()
		
func _on_start_pressed():
	Global.score = 0
	Global.stageNum = null
	get_tree().change_scene_to_file("res://scenes/game.tscn")

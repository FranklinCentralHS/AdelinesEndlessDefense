extends Button

func _input(event):
	if event.is_action_pressed("p1_start") or event.is_action_pressed("p2_start"):
		_on_pressed()

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Global.start_stage.emit()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")

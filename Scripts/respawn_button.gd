extends Button



func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

	Global.start_stage.emit()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/start.tscn")

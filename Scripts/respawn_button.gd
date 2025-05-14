extends Button

func _input(event):
	if event.is_action_pressed("p1_start") or event.is_action_pressed("p2_start"):
		_on_pressed()

func _on_pressed():
	Global.level = 1
	Global.stageNum = Global.stageNum - 1
	Global.start_stage.emit()
	get_tree().change_scene_to_file("res://scenes/game.tscn")



func _on_button_2_pressed():
	Global.level = 1
	Global.stageNum = 1
	get_tree().change_scene_to_file("res://scenes/start.tscn")

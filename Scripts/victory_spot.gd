extends Node2D

var won = false
@onready var parent = self.get_parent()
@onready var grandparent = parent.get_parent()


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		if won == true:
			Global.level +=1
			print("has won")


		else:
			if Global.level == 8:#last level:
				get_parent().get_child(43).level_over = true
			else:
				Global.level += 1
				print("next level")
				Global.next_stage.emit()

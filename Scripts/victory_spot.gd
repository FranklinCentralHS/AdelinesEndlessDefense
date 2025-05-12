extends Node2D

@onready var parent = self.get_parent()
@onready var grandparent = parent.get_parent()
var entered = false

func _on_ready():
	entered = false

func _on_area_2d_area_entered(area):
	if entered:
		return
		
	entered = true
	print("victory spot entered")
	print(area)
	if area.get_parent() is Player:
		Global.level += 1
		print("next level")
		Global.next_stage.emit()

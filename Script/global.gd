extends Node
class_name Global
var current_npc = "false"
var can_move = true
var broke_loop = true
var PlayerHp = 3
var Player2Hp = 3
func check_dead():
	if Player2Hp<=0 or PlayerHp<=0:
		get_tree().change_scene_to_file("res://Scenes/death.tscn")
		pass

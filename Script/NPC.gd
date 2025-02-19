extends Node
class_name NPC

func get_dialog():
	var npc = global.current_npc
	return npc.dialog[get_progress()]
func get_progress(): 
	return global.npc_progress.get(global.current_npc.name, 0)

var dialog = []

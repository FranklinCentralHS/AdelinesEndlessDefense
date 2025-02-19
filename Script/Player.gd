extends CharacterBody2D
class_name Player









##Dialog(
func _on_area_2d_area_entered(area:Area2D):
	var npc = area.get_parent()
	
	if npc is NPC:
		start_dialog(npc)

func start_dialog(npc:NPC):
	global.current_npc = npc
	global.can_move = false
	update_dialog()

func end_dialog():
	var dialog:Panel = get_node("Dialog")
	dialog.visible = false
	global.can_move = true
	global.current_npc = null

func update_dialog():
	var panel:Panel = get_node("Dialog")
	var label = panel.get_node("Label")
	panel.visible = true
	
	var npc:NPC = global.current_npc
	var dialog = npc.get_dialog()
	
	label.text = dialog["text"]
	
	for c in panel.get_children():
		if c is Button:
			panel.remove_child(c)
	
	var y = 12

	if "script" in dialog:
		dialog["script"].call()

	var actions:Array = []
	
	if "actions" in dialog:
		actions = dialog["actions"]
	
	elif "next" in dialog:
		actions.append({
			"text": "Next",
			"next": dialog["next"]
		})
	
	else:
		actions.append({
			"text": "Goodbye",
			"exit": true
		})
	
	for action in actions:
		if "loopbreak" in action:
			if global.broke_loop == true:
				continue
				
		var button:Button = Button.new()
		button.text = action["text"]
		button.pressed.connect(self.dialog_action.bind(action))
		button.position.y = y
		button.position.x = 450
		button.set("theme_override_font_sizes/font_size", 20)
		button.size = Vector2(200, 30)
		panel.add_child(button)
		y+= 38

func dialog_action(action):
	var npc = global.current_npc
	
	if "next" in action:
		global.npc_progress[npc.name] = action["next"]
		
	if "exit" in action:
		end_dialog()
		return
		
	update_dialog()
##end dialog)

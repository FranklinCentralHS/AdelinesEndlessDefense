extends NPC

var progress = 0;


func on_ready():
	dialog = [
		{ #0
			"text": "The player should see this xD",
			"actions":[
				{
					"text" : "This would be a button on page 1",
					"next": 1##this would sed the person to dialog progress 1
				},
				{
					"text" : "Goodbye",
					"exit": true#ends dialog
				},
			]
		},
		{ #1
			"text" : "Dialog progress one text",
			"next":0,#re-sets progress then ends dialog
			"exit": true
		}
	]

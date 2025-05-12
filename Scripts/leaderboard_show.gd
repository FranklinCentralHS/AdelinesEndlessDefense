extends Control

func _process(delta):
	var scores = Leaderboard.get_scores()
	for i in range(scores.size()):
		if i < 5:
			$VBoxContainer.get_child(i).text = "%d. %s - %d" % [i+1, scores[i]["name"], scores[i]["score"]]
		else:
			$VBoxContainer2.get_child(i - 5).text = "%d. %s - %d" % [i+1, scores[i]["name"], scores[i]["score"]]

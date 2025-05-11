extends Control

func _ready():
	var scores = Leaderboard.get_scores()
	for i in range(scores.size()):
		$VBoxContainer.get_child(i).text = "%d. %s - %d" % [i+1, scores[i]["name"], scores[i]["score"]]

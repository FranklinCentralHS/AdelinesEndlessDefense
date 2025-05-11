extends Node


var scores = []

const SAVE_PATH = "user://leaderboard.save"
const MAX_ENTRIES = 10

func _ready():
	load_scores()

func load_scores():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var content = file.get_as_text()
		var result = JSON.parse_string(content)
		if typeof(result) == TYPE_ARRAY:
			scores = result
		else:
			scores = []

	else:

		scores = []
	if scores.is_empty():
		save_scores()


func save_scores():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(scores))

func add_score(name: String, score: int):

	scores.append({"name": name, "score": score})
	scores.sort_custom(func(a, b): return b["score"] < a["score"])
	if scores.size() > MAX_ENTRIES:
		scores.resize(MAX_ENTRIES)
	save_scores()

	

func get_scores():
	return scores

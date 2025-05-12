extends Node
signal open_door(name: String)
signal close_door(name: String)
signal enemy_killed()
signal start_stage()
signal next_stage()
signal show_leaderboard()

var kill_points = 0
var level = 1
var stageNum = 2
var score = 0

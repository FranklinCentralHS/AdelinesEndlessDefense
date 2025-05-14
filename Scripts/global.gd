extends Node
signal open_door(name: String)
signal close_door(name: String)
signal enemy_killed()
signal start_stage()
signal next_stage()
signal show_leaderboard()

var kill_points :int = 0
var level :int = 1
var stageNum = 2
var score :int = 0

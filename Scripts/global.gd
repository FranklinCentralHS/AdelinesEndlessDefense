extends Node
var kill_points = 0
signal open_door(name: String)
signal close_door(name: String)
signal enemy_killed()
signal start_stage()
signal next_stage()
var level = 1

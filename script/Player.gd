extends CharacterBody2D
class_name Player

var hp = 3
var max_hp = 3
var is_dead = false
const SPEED = 1030.0
const JUMP_VELOCITY = -1500.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*2
var jump_count = 0
var max_jumps = 2

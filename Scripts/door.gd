extends Node2D

@onready var sprite = $AnimatedSprite2D
@export var doorName = "door"
@export var color = "red"
var current_anim = ""
var switches_pressed = 0

func _ready():
	sprite.play("defult_"+color)
	Global.open_door.connect(_on_door_open)
	Global.close_door.connect(_on_door_close)
	sprite.animation_finished.connect(_on_anim_finished)
	

func _on_door_open(door):
	if door == doorName:
		switches_pressed += 1
		
		if switches_pressed > 0:
			current_anim = "open"
			sprite.play("open_" + color)

func _on_door_close(door):
	if door == doorName:
		switches_pressed -= 1
		
		if switches_pressed == 0:
			current_anim = "close"
			sprite.play("close_" + color)

func _on_anim_finished():

	if current_anim == "open":
		$StaticBody2D/CollisionPolygon2D.disabled = true
	elif current_anim == "close":
		$StaticBody2D/CollisionPolygon2D.disabled = false

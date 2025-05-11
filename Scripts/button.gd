extends Node2D

@export var buttonName = "red"
@export var color = "red"
@onready var sprite = $AnimatedSprite2D
var pushCount = 0
func _ready():
	sprite.play("defult_"+color)

func _on_area_2d_body_entered(body):
	pushCount += 1
	
	if pushCount == 1:
		sprite.play(color+"_pressed")
		Global.open_door.emit(buttonName)

func _on_area_2d_body_exited(body):
	pushCount -= 1
	
	if pushCount == 0:
		sprite.play("defult_"+color)
		Global.close_door.emit(buttonName)

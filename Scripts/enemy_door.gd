extends Node2D

@onready var label:Label = $Label
@onready var timer:Timer = $Timer
@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D


@export var num_enemies = 3
var num_enemies_killed = 0
var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false
	update_label()
	Global.enemy_killed.connect(_on_enemy_killed)

func update_label():
	label.text = "Kill %s more enemies to open door" % (num_enemies - num_enemies_killed)

func _on_area_2d_area_entered(area):
	var body = area.get_parent()
	
	if body is Player:
		label.visible = true
		timer.start(2)

func _on_timer_timeout():
	label.visible = false
	
func _on_enemy_killed():
	if open:
		return
		
	num_enemies_killed += 1
	update_label()

	if num_enemies_killed >= num_enemies:
		open = true
		sprite.play("open")
		$StaticBody2D.queue_free()
		$Area2D.queue_free()	

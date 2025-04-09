extends Node2D
class_name weapon

var damage: int = 10
var range: int = 100
var cooldown: float = 1.0
var cooldown_timer: float = 0.0
var is_shooting = false
var BulletScene: PackedScene = load("res://scenes/bullet.tscn")
func _ready():
	damage = 10
	range = 100
	cooldown = 1.0
	cooldown_timer = 0.0
	is_shooting = false
	cooldown_timer = cooldown
func _process(delta: float) -> void:
	if cooldown_timer > 0:
		cooldown_timer -= delta
	else:
		cooldown_timer = 0
	if is_shooting:
		shoot()
		is_shooting = false
func shoot() -> void:
	if cooldown_timer <= 0:
		var bullet = BulletScene.instantiate()
		bullet.position = position
		bullet.damage = damage
		bullet.range = range
		bullet.cooldown = cooldown
		bullet.cooldown_timer = cooldown
		get_parent().add_child(bullet)
		cooldown_timer = cooldown

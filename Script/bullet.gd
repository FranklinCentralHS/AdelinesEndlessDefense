extends Node2D
class_name Bullet

var damage: int = 10
var range: int = 100
var cooldown: float = 1.0
var cooldown_timer: float = 0.0
var is_shooting = false
var BulletScene: PackedScene = load("res://scenes/bullet.tscn")
var speed: float = 4000.0
var direction: Vector2 = Vector2.ZERO
var target: Vector2 = Vector2.ZERO
var distance_traveled: float = 0.0
var max_distance: float = 1000.0
var is_active: bool = true
var is_fired: bool = false
var is_hit: bool = false
var hit_timer: float = 0.0
var hit_duration: float = 0.5

func _ready():
	damage = 10
	range = 100
	cooldown = 1.0
	cooldown_timer = 0.0
	is_shooting = false
	cooldown_timer = cooldown
	direction = Vector2.ZERO
	target = Vector2.ZERO
	distance_traveled = 0.0
	max_distance = 1000.0
	is_active = true
	is_fired = false
	is_hit = false
	hit_timer = 0.0
	hit_duration = 0.5


func _process(delta: float) -> void:
	if is_active:

		is_fired = true
		direction = Vector2.RIGHT

		var movement = direction * speed * delta
		position += movement
		distance_traveled += movement.length()

		if distance_traveled >= max_distance:
			queue_free()

		if is_hit:
			hit_timer += delta
			if hit_timer >= hit_duration:
				queue_free()


func check_hit(body):
	if body is enemy:
		body.get_parent().hp -= damage
		is_hit = true
		hit_timer = 0.0

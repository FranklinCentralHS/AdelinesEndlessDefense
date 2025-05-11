extends Node2D

var start_position:Vector2 = Vector2(0,0)
var dropping = false
var dropping_started = false
var shake = 5
const DROP_SPEED = 2000

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position.x = position.x
	start_position.y = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dropping:
		position.y += delta * DROP_SPEED
	elif dropping_started:
		if position.x > start_position.x + 100:
			shake = -30
		elif position.x < start_position.x - 100:
			shake = 30
		position.x += shake

func _on_area_2d_area_entered(area):
	if dropping or dropping_started:
		return
		
	var body = area.get_parent()
	
	if body is Player:
		dropping_started = true
		$Timer.start(1)
		
func _on_timer_timeout():
	if dropping:
		dropping = false
		dropping_started = false
		$StaticBody2D/CollisionShape2D.disabled = false
		$Area2D/CollisionShape2D.disabled = false
		position.x = start_position.x
		position.y = start_position.y
	elif dropping_started:
		dropping = true
		$StaticBody2D/CollisionShape2D.disabled = true
		$Area2D/CollisionShape2D.disabled = true
		$Timer.start(5)
		

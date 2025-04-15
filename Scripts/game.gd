extends Node2D

@onready var p1:Player = $Adaline
@onready var p2:Player = $Inferno
@onready var cameraTarget:Node2D = $CameraTarget
@onready var p1_life:ColorRect = $Camera2D/p1_life
@onready var p2_life:ColorRect = $Camera2D/p2_life

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# center the camera between the two players
	cameraTarget.position.x = (p1.position.x + p2.position.x) / 2
	cameraTarget.position.y = (p1.position.y + p2.position.y) / 2 - 300
	
	# if the players are too far apart to fit on the screen
	# move them closer together
	var player_distance = p1.position.distance_to(p2.position)
	
	if player_distance > get_viewport_rect().size.x - 256:
		p1.velocity.x = ((p1.position - p2.position).normalized() * -300).x
		p2.velocity.x = ((p2.position - p1.position).normalized() * -300).x

		p1.move_and_slide()
		p2.move_and_slide()
		
	p1_life.size.x = p1.hp * 5
	p2_life.size.x = p2.hp * 5
	
	
	

extends Node2D

@onready var p1:CharacterBody2D = $Adaline;
@onready var p2:CharacterBody2D = $Inferno;
@onready var cameraTarget:Node2D = $CameraTarget;

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
	
	
	

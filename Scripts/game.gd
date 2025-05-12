extends Node2D

@onready var p1: Player = $Adaline as Player # ("/root/Game/Adaline")
@onready var p2: Player = $Inferno as Player # get_node("/root/Game/Inferno")
@onready var cameraTarget: Node2D = get_node("/root/Game/CameraTarget")
@onready var p1_life = get_node("/root/Game/Camera2D/p1_life")
@onready var p2_life = get_node("/root/Game/Camera2D/p2_life")

var stageScene = null

var stages = [
	{ "scene": "res://Stages/Stage1.tscn", "startX": 550, "startY": 3250 },
	{ "scene": "res://Stages/Stage2.tscn", "startX": 0, "startY": 2250 },
	{ "scene": "res://Stages/Stage3.tscn", "startX": 495, "startY": 1225 },
	{ "scene": "res://scenes/win.tscn", "startX": 5000, "startY": 4000 },
]

func _ready():
	Global.next_stage.connect(next_stage)
	Global.start_stage.connect(start_stage)
	next_stage()

func _process(_delta: float) -> void:
	if not stageScene: return

	if p1 and p2 and cameraTarget:
		cameraTarget.position.x = (p1.position.x + p2.position.x) / 2
		cameraTarget.position.y = (p1.position.y + p2.position.y) / 2 - 200

	# if the players are too far apart to fit on the screen
	# move them closer together
	var player_distance = p1.position.distance_to(p2.position)

	if player_distance > 5500:
		p1.velocity.x = ((p1.position - p2.position).normalized() * -300).x
		p2.velocity.x = ((p2.position - p1.position).normalized() * -300).x

		p1.move_and_slide()
		p2.move_and_slide()
	# update the life bars
	p1_life.size.x = p1.hp * 5
	p2_life.size.x = p2.hp * 5

func next_stage():
	print("running stage")

	if Global.stageNum == null:
		Global.stageNum = 0
		print("set 0")

	else:
		Global.stageNum += 1
		print("+1")

	Global.score += Global.stageNum * 1000
		
	start_stage()

func start_stage():
	print("Starting stage %s" % Global.stageNum)

	if stageScene:
		#remove current stage
		remove_child(stageScene)
	
	var sceneName:String

	if len(stages) > Global.stageNum:
		print("big func")
		var stage = stages[Global.stageNum]
		sceneName = stage.scene
		p1.position.x = stage.startX
		p1.position.y = stage.startY
		p2.position.x = stage.startX + 50
		p2.position.y = stage.startY + 150

	var newScene = load(sceneName).instantiate()

	add_child(newScene)
	stageScene = newScene
	print("child loaded")
	move_child(newScene, 0)

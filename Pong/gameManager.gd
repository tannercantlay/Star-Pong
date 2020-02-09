extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var roundsPlayed = 1
var velocity = Vector2(0,0)
var timer = 500

onready var wormholes = preload("res://Scenes/wormholes.tscn")
onready var player_vars = get_node("/root/PlayerVariables")
onready var roundLabel = get_node("../Node/RoundsPlayed")
var powerup
# Called when the node enters the scene tree for the first time.
func _ready():
	roundLabel.set_text("Round: " + str(roundsPlayed))
	pass # Replace with function body.

func hit(team):
	var collision = move_and_collide(velocity)
	if(team == "purple"):
		player_vars.p1Score += 1
		player_vars.numrounds -= 1
	if(team == "yellow"):
		player_vars.p2Score += 1
		player_vars.numrounds -= 1
	roundsPlayed += 1
	roundLabel.set_text("Round: " + str(roundsPlayed))
	pass

func _physics_process(delta):
	timer -= 1

	if(timer == 0):
		var whichpowerup = 1
		
		if(powerup != null):
			get_node("..").remove_child(powerup)
		print_debug("time up")
		if (whichpowerup == 1):
			powerup = wormholes.instance()
			get_node("..").add_child(powerup)
			var wormhole1 = get_node("../Wormholes/Wormhole1")
			var wormhole2 = get_node("../Wormholes/Wormhole2")
			var temp = Vector2(rand_range(-25, -250), rand_range(-250,250))
			wormhole1.position = temp
			temp = Vector2(rand_range(25, 250), rand_range(-250,250))
			wormhole2.position = temp
		#f(whichpowerup == 2):
			
		timer = 500
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
		var powerup
		powerup = wormholes.instance()
		print_debug("time up")
		get_node("..").add_child(powerup)
		timer = 500
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

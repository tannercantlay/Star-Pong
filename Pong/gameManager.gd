extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var roundsPlayed = 1
var velocity = Vector2(0,0)
onready var player_vars = get_node("/root/PlayerVariables")
onready var roundLabel = get_node("../Node/RoundsPlayed")
# Called when the node enters the scene tree for the first time.
func _ready():
	roundLabel.set_text("Round: " + str(roundsPlayed))
	pass # Replace with function body.

func hit(team):
	print_debug("hitting")
	var collision = move_and_collide(velocity)
#	if collision:
#		if collision.collider.has_method("hit"):
#			print_debug("ball Entered Hit Method")
#			collision.collider.hit()
	if(team == "purple"):
		player_vars.p1Score += 1
		player_vars.numrounds -= 1
	if(team == "yellow"):
		player_vars.p2Score += 1
		player_vars.numrounds -= 1
	roundsPlayed += 1
	roundLabel.set_text("Round: " + str(roundsPlayed))
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

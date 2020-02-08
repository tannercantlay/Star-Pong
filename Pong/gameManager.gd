extends KinematicBody2D
var p1Name = "Player 1"
var p2Name = "Player 2"
var p1Score = 0
var p2Score = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit(team):
	print_debug("hitting")
	var collision = move_and_collide(velocity)
#	if collision:
#		if collision.collider.has_method("hit"):
#			print_debug("ball Entered Hit Method")
#			collision.collider.hit()
	if(team == "purple"):
		p1Score += 1
	if(team == "yellow"):
		p2Score += 1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

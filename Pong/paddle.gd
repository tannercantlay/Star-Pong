extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var theta
var locationX
var locationY
#var teamColor = player.color or whatever

# Called when the node enters the scene tree for the first time.
func _ready():
	theta = PI/2
	pass
#	if teamColor == "purple":
#		theta = PI/2
#	else: 
#		theta = 3*PI/4

func _input(event):
	if event is InputEventKey and event.pressed:
		#if statement to determine what teamColor we are
		if event.scancode == KEY_A:
			theta += .1
		elif event.scancode == KEY_D:
			theta -= .1
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	locationX = cos(theta)
	locationY = sin(theta)
	pass

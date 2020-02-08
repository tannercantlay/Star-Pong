extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var theta
var locationX = 0
var locationY = 1
var location
var radius = 22.5
var rotation_dir
var rotation_speed = 1
#var teamColor = player.color or whatever

# Called when the node enters the scene tree for the first time.
func _ready():
	#theta = PI
	rotation_dir = 0
	pass
#	if teamColor == "purple":
#		theta = PI/2
#	else: 
#		theta = 3*PI/4

func _input(event):
	if event is InputEventKey and event.pressed:
		#if statement to determine what teamColor we are
		if event.scancode == KEY_RIGHT:
			rotation_dir += .1
			#theta += .05
			#locationX =  cos(theta)
			#locationY = sin(theta)
			#translate(location)
		elif event.scancode == KEY_LEFT:
			#theta -= .05
			#locationX =  -cos(theta)
			#locationY = -sin(theta)
			#translate(location)
			rotation_dir -= .1
	rotation = rotation_dir * rotation_speed
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#rotation = rotation_dir * rotation_speed * delta
	#location = radius * Vector2(locationX, locationY)
	#print_debug(location)
	
	pass

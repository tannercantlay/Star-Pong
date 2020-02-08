extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var theta = 0
var locationX = 0
var locationY = -1
var location
var radius = 22.5
var rotation_dir
var rotation_speed = 30
var team = "purple"
#var teamColor = player.color or whatever

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_dir = 0
	set_process_input(true)
	pass
func getTeam():
	return team
	
func reset():
	print_debug("reset")
	rotation = 0
	rotation_dir = 0
	pass
	
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 68 and event.is_pressed() == false) or (event.get_scancode() == 65 and event.is_pressed() == false)):
		theta = 0
		#while (abs(theta) > 0.0 && !Input.is_key_pressed(65) && !Input.is_key_pressed(68)):
			#print_debug("in while loop")
			#(theta -= 0.005)
			#rotation_dir -= theta
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(Input.is_key_pressed(65)): #Key_A
		if (abs(theta) < 0.1):
			(theta += 0.006)
		rotation_dir += theta
	if(Input.is_key_pressed(68)): #Key_D
		if (abs(theta) < 0.1):
			(theta += 0.006)
		rotation_dir -= theta
		
		
	rotation = rotation_dir * rotation_speed * delta
	pass

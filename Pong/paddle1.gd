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

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_dir = 0
	set_process_input(true)

func getTeam():
	return team
	
func reset():
	rotation = 0
	rotation_dir = 0
	pass
	
func lockInPlaceFor3Seconds():
	rotation_speed = 0
	var stopMovingYouJerk = Timer.new()
	stopMovingYouJerk.set_wait_time(3)
	stopMovingYouJerk.set_one_shot(true)
	add_child(stopMovingYouJerk)
	stopMovingYouJerk.start()
	yield(stopMovingYouJerk, "timeout")
	rotation_speed = 30
	
func _input(event):
	if event is InputEventKey and ((event.get_scancode() == 68 and event.is_pressed() == false) or (event.get_scancode() == 65 and event.is_pressed() == false)):
		theta = 0	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(Input.is_key_pressed(65)): #Key_A
		if (abs(theta) < 0.11):
			(theta += 0.0035)
		rotation_dir += theta
	if(Input.is_key_pressed(68)): #Key_D
		if (abs(theta) < 0.11):
			(theta += 0.0035)
		rotation_dir -= theta
			
	rotation = rotation_dir * rotation_speed * delta

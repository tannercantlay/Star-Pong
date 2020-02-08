extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var theta
var locationX = 0
var locationY = -1
var location
var radius = 22.5
var rotation_dir
var rotation_speed = 30
var team = -1
#var teamColor = player.color or whatever

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_dir = 0
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(Input.is_key_pressed(65)): #Key_A
		rotation_dir += .1
	if(Input.is_key_pressed(68)): #Key_D
		rotation_dir -= .1
		
	rotation = rotation_dir * rotation_speed * delta
	pass

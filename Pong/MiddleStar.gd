extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var randomDir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func middleStar(vector):
	var angle = randi()%180
	print(angle)
	randomDir.x = (vector.x * cos(angle)) - (sin(angle) * vector.y)
	randomDir.y = (vector.x * sin(angle)) + (cos(angle) * vector.y)
	print(randomDir)
	print_debug("calculating")
	return randomDir
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

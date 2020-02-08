extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var randomDir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func middleStar(vector):
	var angle = rand_range(-(PI/2), (PI/2))
	print(angle)
	randomDir = vector.rotated(angle)
	print(randomDir)
	print_debug("calculating")
	return randomDir
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

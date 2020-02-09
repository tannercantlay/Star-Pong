extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var otherWormhole

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func throughWormhole():
	print_debug("teleporting")
	otherWormhole = get_node("../Wormhole1")
	return otherWormhole.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

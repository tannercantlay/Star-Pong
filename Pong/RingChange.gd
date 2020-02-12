extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player_vars = get_node("/root/PlayerVariables")
# Called when the node enters the scene tree for the first time.
func _ready():
	texture = player_vars.p1RingColor;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

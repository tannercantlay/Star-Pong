extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")
# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_tree().get_current_scene().get_name() == "Name1"):
		texture = player_vars.p1RingColor
	elif(get_tree().get_current_scene().get_name() == "Name2"):
		texture = player_vars.p2RingColor

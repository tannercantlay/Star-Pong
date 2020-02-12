extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player_vars = get_node("/root/PlayerVariables")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body
		
				
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			if(get_tree().get_current_scene().get_name() == "Name1"):
				player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingRedToBlue.png")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingRedToBlue.png")
		get_node("../outer_ring").texture = load("res://Sprites/SpriteSheets/OuterRingBlueToRed.png")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

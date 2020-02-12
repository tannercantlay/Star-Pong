extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			if(get_tree().get_current_scene().get_name() == "Name1"):
				player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingPtoY.png")
			elif(get_tree().get_current_scene().get_name() == "Name2"):
				player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingPtoY.png")
			get_node("../outer_ring").texture = load("res://Sprites/SpriteSheets/OuterRingYtoP.png")

extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingBlueToRed.png")
			player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingRedToBlue.png")
			player_vars.player1Color = "red"
			player_vars.player2Color = "blue"


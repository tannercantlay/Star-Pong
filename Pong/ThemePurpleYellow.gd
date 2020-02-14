extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingYellowToPurple_New.png")
			player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingPurpleToYellow_New.png")
			player_vars.player1Color = "purple"
			player_vars.player2Color = "yellow"
			player_vars.p1PaddleColor = load("res://Sprites/SpriteSheets/Dope_New_Purple_Paddle.png")
			player_vars.p2PaddleColor = load("res://Sprites/SpriteSheets/Dope_New_Yellow_Paddle.png")

			var giantCircle = get_node("../Outer_Ring")
			giantCircle.texture = player_vars.p1RingColor
			var label = get_node("../BackMainMenu/Label")
			label.add_color_override("font_color_shadow", Color("b76ed4"))

			player_vars.ballColor = load("res://Sprites/SpriteSheets/Ball_Purple_Yellow.png")

extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingOrangeToGreen.png")
			player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingGreenToOrange.png")
			player_vars.player1Color = "green"
			player_vars.player2Color = "orange"
			player_vars.p1PaddleColor = load("res://Sprites/SpriteSheets/Dope_Green_Paddle.png")
			player_vars.p2PaddleColor = load("res://Sprites/SpriteSheets/Dope_Orange_Paddle.png")

			var giantCircle = get_node("../Outer_Ring")
			giantCircle.texture = player_vars.p1RingColor
			var label = get_node("../BackMainMenu/Label")
			label.add_color_override("font_color_shadow", Color("089217"))

			player_vars.ballColor = load("res://Sprites/SpriteSheets/Ball_Green_Orange.png")

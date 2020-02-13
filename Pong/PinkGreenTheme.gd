extends Sprite

onready var player_vars = get_node("/root/PlayerVariables")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and not event.is_echo() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(get_local_mouse_position()):
			player_vars.p1RingColor = load("res://Sprites/SpriteSheets/OuterRingPinkToGreen.png")
			player_vars.p2RingColor = load("res://Sprites/SpriteSheets/OuterRingGreenToPink.png")
			player_vars.player1Color = "green"
			player_vars.player2Color = "pink"
			player_vars.p1PaddleColor = load("res://Sprites/SpriteSheets/Green_Paddle.png")
			player_vars.p2PaddleColor = load("res://Sprites/SpriteSheets/Pink_Paddle.png")

			var giantCircle = get_node("../Outer_Ring")
			giantCircle.texture = player_vars.p1RingColor

